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
        UIViewController* _vc = [[_nc viewControllers] firstObject];
        if ([[segue identifier] isEqualToString:@"ShowFavoriteView"])
        {
            ((RecipesTableViewController*)_vc).state = RecipesViewControllerStateFavorite;
            _vc.title = @"Favorites";
        }
        else if ([[segue identifier] isEqualToString:@"ShowRecipeView"])
        {
            ((RecipesTableViewController*)_vc).state = RecipesViewControllerStateNormal;
        }
        else if ([[segue identifier] isEqualToString:@"ShowPresentationView"])
        {
            _vc.navigationItem.rightBarButtonItem = nil;
        }
    }
}

@end
