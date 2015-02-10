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

- (void)loadRecipesWithCompletition:(void(^)(void))completition
                            failure:(void(^)(NSError* error))failure;

@property (nonatomic, strong) NSArray* arrayRecipes;

@end
