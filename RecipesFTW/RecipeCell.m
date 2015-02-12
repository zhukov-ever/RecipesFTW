//
//  RecipeCell.m
//  RecipesFTW
//
//  Created by Zhn on 11/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "RecipeCell.h"
#import "Recipe.h"
#import "RecipeManager.h"
#import "UIImageView+WebCache.h"
#import <AXRatingView/AXRatingView.h>
#import "DateHelper.h"

@interface RecipeCell()
{
    AXRatingView* m_starControl;
}

@end

@implementation RecipeCell
@synthesize recipe = m_recipe;

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    if (!m_starControl)
    {
        m_starControl = [[AXRatingView alloc] initWithFrame:[self.viewForStars bounds]];
        m_starControl.value = 0;
        m_starControl.stepInterval = 0.1;
        m_starControl.userInteractionEnabled = NO;
        [self.viewForStars addSubview:m_starControl];
    }
}

- (void)setRecipe:(Recipe*)recipe
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
    m_starControl.value = [self.recipe.difficulty doubleValue];
    
    self.buttonFavorite.selected = [self.recipe.favorite boolValue];
    self.labelDateUpdate.text = [[DateHelper dateFormatter] stringFromDate:self.recipe.dateUpdate];

    [self.imageViewRecipe sd_setImageWithURL:[NSURL URLWithString:self.recipe.imageUrlString]];

}


#pragma mark - handlers

- (IBAction)favoriteHandler:(UIButton*)sender
{
    sender.selected = !sender.selected;
    [[RecipeManager shared] recipe:self.recipe
                       setFavorite:sender.selected
                      completition:^
     {
         
     } failure:^(NSError *error) {
         sender.selected = [self.recipe.favorite boolValue];
     }];
}


@end
