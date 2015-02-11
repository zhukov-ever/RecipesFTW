//
//  MenuTableViewController.m
//  RecipesFTW
//
//  Created by Zhn on 10/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "MenuTableViewController.h"
#import "MenuRouter.h"

@implementation MenuTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [[MenuRouter new] prepareForSegue:segue sender:sender];
}


@end
