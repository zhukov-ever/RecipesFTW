//
//  RecipeManager.h
//  RecipesFTW
//
//  Created by Zhn on 11/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "NVBaseSingleton.h"
#import "Recipe.h"

@interface RecipeManager : NVBaseSingleton

- (void)loadRecipesForce:(BOOL)isForce
            completition:(void (^)(void))completition
                 failure:(void (^)(NSError* error))failure;

@property (atomic, strong) NSArray* arrayRecipes;
@property (atomic, strong) NSArray* arrayFavoriteRecipes;

- (void) recipe:(Recipe*)recipe setFavorite:(BOOL)isFavorite;

@end
