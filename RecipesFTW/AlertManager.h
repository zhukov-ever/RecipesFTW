//
//  AlertManager.h
//  RecipesFTW
//
//  Created by Zhn on 13/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "NVBaseSingleton.h"

@class UIAlertView;

@interface AlertManager : NVBaseSingleton

- (UIAlertView*) alertForError:(NSError*)error;

@end
