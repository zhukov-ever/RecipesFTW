//
//  MenuTableViewController.m
//  RecipesFTW
//
//  Created by Zhn on 10/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "MenuTableViewController.h"
#import "MenuRouter.h"
#import "ThemeManager.h"

@implementation MenuTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[[ThemeManager shared] theme] menuTableView:self.tableView];
    [[[ThemeManager shared] theme] menuFavoriteIco:self.imageViewFavorite];
    for (UILabel* _label in self.arrayCellTitle)
    {
        [[[ThemeManager shared] theme] menuLabel:_label];
    }
    for (UITableViewCell* _cell in self.arrayCell)
    {
        [[[ThemeManager shared] theme] menuCell:_cell];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [[MenuRouter new] prepareForSegue:segue sender:sender];
    
    
}


@end
