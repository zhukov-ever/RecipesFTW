//
//  RecipeCell.h
//  RecipesFTW
//
//  Created by Zhn on 11/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Recipe;

@interface RecipeCell : UITableViewCell

@property (nonatomic, strong) Recipe* recipe;

@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelDifficulty;
@property (weak, nonatomic) IBOutlet UIButton *buttonFavorite;

- (IBAction)favoriteHandler:(UIButton*)sender;

@end
