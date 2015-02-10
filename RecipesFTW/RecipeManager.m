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

- (void)loadRecipesWithCompletition:(void(^)(void))completition
                            failure:(void(^)(NSError* error))failure
{
    [[self httpManager] GET:[kBaseUrl stringByAppendingPathComponent:kRecipes]
                 parameters:nil
                    success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         [self parseRecipesFromResponse:responseObject];
         if (completition) completition();
     }
                    failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         if (failure) failure(error);
     }];
}

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
        self.arrayRecipes = [NSArray arrayWithArray:_array];
    }
}



#pragma mark - private

- (AFHTTPRequestOperationManager*) httpManager
{
    AFHTTPRequestOperationManager *_manager = [AFHTTPRequestOperationManager manager];
    
    AFSecurityPolicy *_securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    _manager.securityPolicy = _securityPolicy;
    
    _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    return _manager;
}

@end
