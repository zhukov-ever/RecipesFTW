//
//  RecipeManager.m
//  RecipesFTW
//
//  Created by Zhn on 11/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "RecipeManager.h"
#import <AFNetworking/AFNetworking.h>
#import "CoreDataManager.h"

#define kBaseUrl @"http://hyper-recipes.herokuapp.com"
#define kRecipes @"recipes"


@implementation RecipeManager
@synthesize arrayRecipes = m_arrayRecipes;

+ (instancetype)shared
{
    return [RecipeManager sharedWithClass:[RecipeManager class]];
}



#pragma mark - public

- (void)loadRecipesForce:(BOOL)isForce
            completition:(void (^)(void))completition
                 failure:(void (^)(NSError* error))failure
{
    [self fetchRecipes];
    
    if (!isForce && [self.arrayRecipes count] > 0)
    {
        [self makeFavoriteArray];
        [self sortRecipesByDate];
        
        if (completition) completition();
        return;
    }
    
    [[self httpManager] GET:[kBaseUrl stringByAppendingPathComponent:kRecipes]
                 parameters:nil
                    success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
             [self parseRecipesFromResponse:responseObject];
             if (completition)
             {
                 dispatch_sync(dispatch_get_main_queue(), ^{
                     completition();
                 });
             }
         });

     }
                    failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         if (failure) failure(error);
     }];
}

- (void) recipe:(Recipe*)recipe
    setFavorite:(BOOL)isFavorite
   completition:(void (^)(void))completition
        failure:(void (^)(NSError* error))failure
{
    if (recipe)
    {
        NSString* _urlString = [kBaseUrl stringByAppendingFormat:@"/%@/%@", kRecipes, recipe.realId];
        NSDictionary* _dict = @{
                                @"recipe":@{
                                        @"favorite":@(isFavorite)
                                        }
                                };
        
        [[self httpManager] PUT:_urlString parameters:_dict success:^(AFHTTPRequestOperation *operation, id responseObject)
        {
            recipe.favorite = [NSNumber numberWithBool:isFavorite];
            
            NSError* _error;
            [[[CoreDataManager shared] managedObjectContext] save:&_error];
            
            [self makeFavoriteArray];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            failure(error);
        }];

    }
}



#pragma mark - private

- (void) fetchRecipes
{
    NSError* _error;
    NSFetchRequest* _fetchRecipes = [NSFetchRequest new];
    [_fetchRecipes setEntity:[NSEntityDescription entityForName:[Recipe description] inManagedObjectContext:[[CoreDataManager shared] managedObjectContext]]];
    NSArray* _arrayRecipes = [[[CoreDataManager shared] managedObjectContext] executeFetchRequest:_fetchRecipes error:&_error];
    m_arrayRecipes = _arrayRecipes;
}

- (void) sortRecipesByDate
{
    NSComparator _comparator = ^NSComparisonResult(id obj1, id obj2) {
        Recipe* _recipe1 = (Recipe*)obj1;
        Recipe* _recipe2 = (Recipe*)obj2;
        return [_recipe2.dateUpdate compare:_recipe1.dateUpdate];
    };
    
    self.arrayRecipes = [self.arrayRecipes sortedArrayUsingComparator:_comparator];
    self.arrayFavoriteRecipes = [self.arrayFavoriteRecipes sortedArrayUsingComparator:_comparator];
}

- (void) makeFavoriteArray
{
    NSPredicate* _predicate = [NSPredicate predicateWithFormat:@"favorite = YES"];
    self.arrayFavoriteRecipes = [self.arrayRecipes filteredArrayUsingPredicate:_predicate];
}

- (void) parseRecipesFromResponse:(id)responseObject
{
    if (responseObject && [responseObject conformsToProtocol:@protocol(NSFastEnumeration)])
    {
        [self fetchRecipes];
        for (Recipe* _recipe in self.arrayRecipes)
        {
            [[[CoreDataManager shared] managedObjectContext] deleteObject:_recipe];
        }
        
        NSMutableArray* _array = [NSMutableArray new];
        for (id _dictRecipe in responseObject)
        {
            if ([_dictRecipe isKindOfClass:[NSDictionary class]])
            {
                Recipe* _recipe = [Recipe objectFromDictionary:_dictRecipe];
                if (_recipe) [_array addObject:_recipe];
            }
        }
        NSError* _error;
        [[[CoreDataManager shared] managedObjectContext] save:&_error];
        self.arrayRecipes = [NSArray arrayWithArray:_array];
        
        [self makeFavoriteArray];
        [self sortRecipesByDate];
    }
}

- (AFHTTPRequestOperationManager*) httpManager
{
    AFHTTPRequestOperationManager *_manager = [AFHTTPRequestOperationManager manager];
    
    AFSecurityPolicy *_securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    _manager.securityPolicy = _securityPolicy;
    
    _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    return _manager;
}

@end
