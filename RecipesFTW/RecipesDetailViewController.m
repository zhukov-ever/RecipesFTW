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

@implementation RecipesDetailViewController
@synthesize recipe = m_recipe;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.recipe)
    {
        [self fillUI];
    }
}


- (void)setRecipe:(Recipe *)recipe
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

    self.labelDifficulty.text = @"diff";
    self.labelDateCreate.text = [self.recipe.dateCreate description];
    self.labelDateUpdate.text = [self.recipe.dateUpdate description];
    self.labelInstructions.text = self.recipe.instructions;
    self.labelDescription.text = self.recipe.desc;
}


@end
