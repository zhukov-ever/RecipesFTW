//
//  RecipeCell.m
//  RecipesFTW
//
//  Created by Zhn on 11/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "RecipeCell.h"
#import "RecipeOld.h"
#import "RecipeManager.h"
#import "UIImageView+WebCache.h"

@interface RecipeCell()

@end

@implementation RecipeCell
@synthesize recipe = m_recipe;

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    m_recipe.realId = NSNotFound;
}

- (void)setRecipe:(RecipeOld *)recipe
{
    if (recipe)
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
    self.labelDateUpdate.text = [self.recipe.dateUpdate description];

    [self.imageViewRecipe sd_setImageWithURL:[NSURL URLWithString:self.recipe.imageUrlString]];

}


#pragma mark - handlers

- (IBAction)favoriteHandler:(UIButton*)sender
{
    sender.selected = !sender.selected;
    [[RecipeManager shared] recipe:self.recipe setFavorite:sender.selected];
}


@end
