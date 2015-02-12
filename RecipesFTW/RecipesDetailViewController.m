//
//  RecipesDetailViewController.m
//  RecipesFTW
//
//  Created by Zhn on 12/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "RecipesDetailViewController.h"
#import "Recipe.h"
#import "UIImageView+WebCache.h"
#import <AXRatingView/AXRatingView.h>
#import "DateHelper.h"

@interface RecipesDetailViewController()
{
    AXRatingView* m_starControl;
}

@end

@implementation RecipesDetailViewController
@synthesize recipe = m_recipe;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!m_starControl)
    {
        m_starControl = [[AXRatingView alloc] initWithFrame:[self.viewForStars bounds]];
        m_starControl.value = 0;
        m_starControl.stepInterval = 0.1;
        m_starControl.userInteractionEnabled = NO;
        [self.viewForStars addSubview:m_starControl];
    }
    
    if (self.recipe)
    {
        [self fillUI];
    }
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self.textViewInstructions setNeedsUpdateConstraints];
    [self.textViewDescription setNeedsUpdateConstraints];
}

- (void)setRecipe:(Recipe*)recipe
{
    m_recipe = recipe;
    
    if (self.isViewLoaded)
    {
        [self fillUI];
    }
}


- (void) fillUI
{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.recipe.imageUrlString]];

    self.title = self.recipe.name;
    self.labelDifficulty.text = @"diff";
    self.labelDateUpdate.text = [[DateHelper dateFormatter] stringFromDate:self.recipe.dateUpdate];
    self.textViewInstructions.text = self.recipe.instructions;
    self.textViewDescription.text = self.recipe.desc;
    m_starControl.value = [self.recipe.difficulty doubleValue];
    
}


@end
