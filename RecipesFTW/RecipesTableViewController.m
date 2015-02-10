//
//  RecipesViewController.m
//  RecipesFTW
//
//  Created by Zhn on 10/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "RecipesTableViewController.h"
#import "ViewControllerConfigurator.h"

@interface RecipesTableViewController()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation RecipesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [ViewControllerConfigurator switchOnSwipe:self];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (IBAction)menuHandler:(id)sender
{
    [ViewControllerConfigurator swipeRightFrom:self];
}




#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* _cell = [tableView dequeueReusableCellWithIdentifier:@"RecipeCell"];
    
    _cell.textLabel.text = @"zaozza";
    
    return _cell;
}

@end
