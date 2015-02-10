//
//  RecipeCell.m
//  RecipesFTW
//
//  Created by Zhn on 11/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "RecipeCell.h"
#import "Recipe.h"

@implementation RecipeCell
@synthesize recipe = m_recipe;

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    m_recipe.theId = NSNotFound;
}

- (void)setRecipe:(Recipe *)recipe
{
    if (recipe && recipe.theId != m_recipe.theId)
    {
        m_recipe = recipe;
        [self fillUI];
    }
}

- (void) fillUI
{
    self.labelName.text = self.recipe.name;
    if (self.recipe.difficulty)
    {
        self.labelDifficulty.hidden = NO;
        self.labelDifficulty.text = [NSString stringWithFormat:@"difficulty: %@", self.recipe.difficulty];
    }
    else
    {
        self.labelDifficulty.hidden = YES;
    }
    self.buttonFavorite.selected = self.recipe.isFavorite;
}

- (IBAction)favoriteHandler:(UIButton*)sender
{
    if (self.recipe)
    {
        sender.selected = !sender.selected;
        self.recipe.favorite = sender.selected;
    }
}
@end
