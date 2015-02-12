// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Recipe.m instead.

#import "_Recipe.h"

const struct RecipeAttributes RecipeAttributes = {
	.dateCreate = @"dateCreate",
	.dateUpdate = @"dateUpdate",
	.desc = @"desc",
	.difficulty = @"difficulty",
	.favorite = @"favorite",
	.imageUrlString = @"imageUrlString",
	.instructions = @"instructions",
	.name = @"name",
	.realId = @"realId",
};

@implementation RecipeID
@end

@implementation _Recipe

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Recipe" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Recipe";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Recipe" inManagedObjectContext:moc_];
}

- (RecipeID*)objectID {
	return (RecipeID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"difficultyValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"difficulty"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"favoriteValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"favorite"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"realIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"realId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic dateCreate;

@dynamic dateUpdate;

@dynamic desc;

@dynamic difficulty;

- (double)difficultyValue {
	NSNumber *result = [self difficulty];
	return [result doubleValue];
}

- (void)setDifficultyValue:(double)value_ {
	[self setDifficulty:@(value_)];
}

- (double)primitiveDifficultyValue {
	NSNumber *result = [self primitiveDifficulty];
	return [result doubleValue];
}

- (void)setPrimitiveDifficultyValue:(double)value_ {
	[self setPrimitiveDifficulty:@(value_)];
}

@dynamic favorite;

- (BOOL)favoriteValue {
	NSNumber *result = [self favorite];
	return [result boolValue];
}

- (void)setFavoriteValue:(BOOL)value_ {
	[self setFavorite:@(value_)];
}

- (BOOL)primitiveFavoriteValue {
	NSNumber *result = [self primitiveFavorite];
	return [result boolValue];
}

- (void)setPrimitiveFavoriteValue:(BOOL)value_ {
	[self setPrimitiveFavorite:@(value_)];
}

@dynamic imageUrlString;

@dynamic instructions;

@dynamic name;

@dynamic realId;

- (int32_t)realIdValue {
	NSNumber *result = [self realId];
	return [result intValue];
}

- (void)setRealIdValue:(int32_t)value_ {
	[self setRealId:@(value_)];
}

- (int32_t)primitiveRealIdValue {
	NSNumber *result = [self primitiveRealId];
	return [result intValue];
}

- (void)setPrimitiveRealIdValue:(int32_t)value_ {
	[self setPrimitiveRealId:@(value_)];
}

@end

