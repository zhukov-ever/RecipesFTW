//
//  RecipesViewController.m
//  RecipesFTW
//
//  Created by Zhn on 10/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "RecipesTableViewController.h"
#import "SliderConfigurator.h"

#import "RecipeCell.h"
#import "RecipeManager.h"

@interface RecipesTableViewController()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation RecipesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [SliderConfigurator switchOnSwipe:self];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshHandler:) forControlEvents:UIControlEventValueChanged];
    
    [[RecipeManager shared] loadRecipesForce:NO completition:^{
       [self reloadData];
    } failure:^(NSError *error) {
        
    }];
}

- (IBAction)menuHandler:(id)sender
{
    [SliderConfigurator swipeRightFrom:self];
}



#pragma mark - private

- (void) refreshHandler:(UIRefreshControl*)sender
{
    [[RecipeManager shared] loadRecipesForce:YES completition:^{
        [self.refreshControl endRefreshing];
        [self reloadData];
    } failure:^(NSError *error) {
        
    }];
}

- (void) reloadData
{
    [self.tableView reloadData];
}



#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[RecipeManager shared].arrayRecipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecipeCell* _cell = [tableView dequeueReusableCellWithIdentifier:@"RecipeCell"];
    
    Recipe* _recipe = [[RecipeManager shared].arrayRecipes objectAtIndex:indexPath.row];
    _cell.recipe = _recipe;
    
    return _cell;
}

@end
