//
//  RecipesDetailViewController.h
//  RecipesFTW
//
//  Created by Zhn on 12/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResizableTextView.h"

@class Recipe;

@interface RecipesDetailViewController : UIViewController

@property (nonatomic, strong) Recipe* recipe;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelDifficulty;
@property (weak, nonatomic) IBOutlet UILabel *labelDateUpdate;
@property (weak, nonatomic) IBOutlet ResizableTextView *textViewInstructions;
@property (weak, nonatomic) IBOutlet ResizableTextView *textViewDescription;
@property (weak, nonatomic) IBOutlet UIView *viewForStars;


@end
