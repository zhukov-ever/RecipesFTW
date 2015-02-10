//
//  RecipesViewController.m
//  RecipesFTW
//
//  Created by Zhn on 10/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "RecipesViewController.h"
#import "ViewControllerConfigurator.h"

@implementation RecipesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [ViewControllerConfigurator switchOnSwipe:self];
}

- (IBAction)menuHandler:(id)sender
{
    [ViewControllerConfigurator swipeRightFrom:self];
}


@end
