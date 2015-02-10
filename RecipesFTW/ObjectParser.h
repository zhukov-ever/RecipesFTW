//
//  ObjectParser.h
//  RecipesFTW
//
//  Created by Zhn on 11/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import <Foundation/Foundation.h>

#define apiObj(x, y) ([ObjectParser objectFromAPI:(x) returnedClass:(y)])

@interface ObjectParser : NSObject

+ (id) objectFromAPI:(id)obj
       returnedClass:(Class)objClass;

@end
