//
//  RecipesRouter.m
//  RecipesFTW
//
//  Created by Zhn on 12/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "RecipesRouter.h"
#import "RecipesDetailViewController.h"
#import "Recipe.h"

@implementation RecipesRouter

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{    
    UIViewController* _vc = [segue destinationViewController];
    if ([_vc isKindOfClass:[RecipesDetailViewController class]])
    {
        ((RecipesDetailViewController*)_vc).recipe = self.recipe;
    }
}

@end
