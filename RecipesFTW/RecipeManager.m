//
//  RecipeManager.m
//  RecipesFTW
//
//  Created by Zhn on 11/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "RecipeManager.h"
#import <AFNetworking/AFNetworking.h>


#define kBaseUrl @"http://hyper-recipes.herokuapp.com"
#define kRecipes @"recipes"


@implementation RecipeManager

+ (instancetype)shared
{
    return [RecipeManager sharedWithClass:[RecipeManager class]];
}



#pragma mark - public

- (void)loadRecipesForce:(BOOL)isForce
            completition:(void (^)(void))completition
                 failure:(void (^)(NSError* error))failure
{
    if (!isForce && [self.arrayRecipes count] > 0)
    {
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

- (void) recipe:(Recipe*)recipe setFavorite:(BOOL)isFavorite;
{
    if (recipe)
    {
        recipe.favorite = isFavorite;
        [self makeFavoriteArray];
    }
}



#pragma mark - private

- (void) parseRecipesFromResponse:(id)responseObject
{
    if (responseObject && [responseObject conformsToProtocol:@protocol(NSFastEnumeration)])
    {
        NSMutableArray* _array = [NSMutableArray new];
        for (id _dictRecipe in responseObject)
        {
            if ([_dictRecipe isKindOfClass:[NSDictionary class]])
            {
                Recipe* _recipe = [Recipe objectFromDictionary:_dictRecipe];
                if (_recipe) [_array addObject:_recipe];
            }
        }
        self.arrayRecipes = [_array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            Recipe* _recipe1 = (Recipe*)obj1;
            Recipe* _recipe2 = (Recipe*)obj2;
            return [_recipe2.dateUpdate compare:_recipe1.dateUpdate];
        }];
        
        [self makeFavoriteArray];
    }
}

- (void) makeFavoriteArray
{
    NSPredicate* _predicate = [NSPredicate predicateWithFormat:@"isFavorite = YES"];
    self.arrayFavoriteRecipes = [self.arrayRecipes filteredArrayUsingPredicate:_predicate];
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
