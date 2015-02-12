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
#import "RecipesRouter.h"

#import "PresentationRouter.h"

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
    
    
    [[PresentationRouter new] gotoMeFrom:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RecipesRouter* _router = [RecipesRouter new];
    RecipeCell* _cell = (RecipeCell*)[self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
    _router.recipe = _cell.recipe;
    [_router prepareForSegue:segue sender:sender];
}


#pragma mark - handlers

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [m_arrayRecipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecipeCell* _cell = [tableView dequeueReusableCellWithIdentifier:@"RecipeCell"];
    
    RecipeOld* _recipe = [m_arrayRecipes objectAtIndex:indexPath.row];
    _cell.recipe = _recipe;
    _cell.indexPath = [indexPath copy];
    
    
    return _cell;
}

@end
