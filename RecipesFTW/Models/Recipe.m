#import "Recipe.h"
#import "ObjectParser.h"
#import "CoreDataManager.h"

@interface Recipe ()

// Private interface goes here.

@end

@implementation Recipe

+ (instancetype)objectFromDictionary:(NSDictionary *)dictionary
{
    Recipe* _recipe = [Recipe insertInManagedObjectContext:[[CoreDataManager shared] managedObjectContext]];
    
    NSNumber* _numberId = apiObj([dictionary objectForKey:@"id"], [NSNumber class]);
    if (!_numberId) return nil;
    [_recipe setRealId:_numberId];
    
    _recipe.name = apiObj([dictionary objectForKey:@"name"], [NSString class]);
    _recipe.desc = apiObj([dictionary objectForKey:@"description"], [NSString class]);
    _recipe.difficulty = apiObj([dictionary objectForKey:@"difficulty"], [NSNumber class]);
    NSNumber* _numberFavorite = apiObj([dictionary objectForKey:@"favorite"], [NSNumber class]);
    _recipe.favorite = _numberFavorite;
    _recipe.instructions = apiObj([dictionary objectForKey:@"instructions"], [NSString class]);
    
    NSDateFormatter* _dateFormatter = [NSDateFormatter new];
    _dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSSZ";
    NSString* _dateStringCreate = apiObj([dictionary objectForKey:@"created_at"], [NSString class]);
    _recipe.dateCreate = [_dateFormatter dateFromString:_dateStringCreate];
    NSString* _dateStringUpdate = apiObj([dictionary objectForKey:@"updated_at"], [NSString class]);
    _recipe.dateUpdate = [_dateFormatter dateFromString:_dateStringUpdate];
    
    NSDictionary* _dictPhoto = [dictionary objectForKey:@"photo"];
    _recipe.imageUrlString = apiObj([_dictPhoto objectForKey:@"url"], [NSString class]);
    
    return _recipe;
}

@end
