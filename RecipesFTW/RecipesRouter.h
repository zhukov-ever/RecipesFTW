//
//  RecipesRouter.h
//  RecipesFTW
//
//  Created by Zhn on 12/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Recipe;

@interface RecipesRouter : NSObject

@property (nonatomic, strong) Recipe* recipe;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end
