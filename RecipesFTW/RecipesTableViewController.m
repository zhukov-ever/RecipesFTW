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
{
    NSArray* m_arrayRecipes;
}

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
    switch (self.state)
    {
        case RecipesViewControllerStateNormal:
            m_arrayRecipes = [RecipeManager shared].arrayRecipes;
            break;
        case RecipesViewControllerStateFavorite:
            m_arrayRecipes = [RecipeManager shared].arrayFavoriteRecipes;
            break;
    }
    [self.tableView reloadData];
}



#pragma mark - UITableViewDataSource, UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[RecipeCell class]])
    {
        ((RecipeCell*)cell).visible = YES;
    }
}

-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[RecipeCell class]])
    {
        ((RecipeCell*)cell).visible = NO;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [m_arrayRecipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecipeCell* _cell = [tableView dequeueReusableCellWithIdentifier:@"RecipeCell"];
    
    Recipe* _recipe = [m_arrayRecipes objectAtIndex:indexPath.row];
    _cell.recipe = _recipe;
    
    return _cell;
}

@end
