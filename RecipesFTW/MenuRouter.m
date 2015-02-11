//
//  MenuRouter.m
//  RecipesFTW
//
//  Created by Zhn on 12/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "MenuRouter.h"
#import "RecipesTableViewController.h"

@implementation MenuRouter

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue identifier])
    {
        UINavigationController* _nc = [segue destinationViewController];
        RecipesTableViewController* _vc = [[_nc viewControllers] firstObject];
        if ([[segue identifier] isEqualToString:@"ShowFavoriteView"])
        {
            _vc.state = RecipesViewControllerStateFavorite;
        }
        else if ([[segue identifier] isEqualToString:@"ShowRecipeView"])
        {
            _vc.state = RecipesViewControllerStateNormal;
        }
    }
}

@end
