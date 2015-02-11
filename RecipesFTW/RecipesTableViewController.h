//
//  RecipesViewController.h
//  RecipesFTW
//
//  Created by Zhn on 10/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RecipesViewControllerStates)
{
    RecipesViewControllerStateNormal,
    RecipesViewControllerStateFavorite
};

@interface RecipesTableViewController : UITableViewController

@property (nonatomic) RecipesViewControllerStates state;

- (IBAction)menuHandler:(id)sender;

@end
