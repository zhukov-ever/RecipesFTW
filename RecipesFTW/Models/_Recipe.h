// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Recipe.h instead.

@import CoreData;

extern const struct RecipeAttributes {
	__unsafe_unretained NSString *dateCreate;
	__unsafe_unretained NSString *dateUpdate;
	__unsafe_unretained NSString *desc;
	__unsafe_unretained NSString *difficulty;
	__unsafe_unretained NSString *favorite;
	__unsafe_unretained NSString *imageUrlString;
	__unsafe_unretained NSString *instructions;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *realId;
} RecipeAttributes;

@interface RecipeID : NSManagedObjectID {}
@end

@interface _Recipe : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) RecipeID* objectID;

@property (nonatomic, strong) NSDate* dateCreate;

//- (BOOL)validateDateCreate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* dateUpdate;

//- (BOOL)validateDateUpdate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* desc;

//- (BOOL)validateDesc:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* difficulty;

@property (atomic) double difficultyValue;
- (double)difficultyValue;
- (void)setDifficultyValue:(double)value_;

//- (BOOL)validateDifficulty:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* favorite;

@property (atomic) BOOL favoriteValue;
- (BOOL)favoriteValue;
- (void)setFavoriteValue:(BOOL)value_;

//- (BOOL)validateFavorite:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* imageUrlString;

//- (BOOL)validateImageUrlString:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* instructions;

//- (BOOL)validateInstructions:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* realId;

@property (atomic) int32_t realIdValue;
- (int32_t)realIdValue;
- (void)setRealIdValue:(int32_t)value_;

//- (BOOL)validateRealId:(id*)value_ error:(NSError**)error_;

@end

@interface _Recipe (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveDateCreate;
- (void)setPrimitiveDateCreate:(NSDate*)value;

- (NSDate*)primitiveDateUpdate;
- (void)setPrimitiveDateUpdate:(NSDate*)value;

- (NSString*)primitiveDesc;
- (void)setPrimitiveDesc:(NSString*)value;

- (NSNumber*)primitiveDifficulty;
- (void)setPrimitiveDifficulty:(NSNumber*)value;

- (double)primitiveDifficultyValue;
- (void)setPrimitiveDifficultyValue:(double)value_;

- (NSNumber*)primitiveFavorite;
- (void)setPrimitiveFavorite:(NSNumber*)value;

- (BOOL)primitiveFavoriteValue;
- (void)setPrimitiveFavoriteValue:(BOOL)value_;

- (NSString*)primitiveImageUrlString;
- (void)setPrimitiveImageUrlString:(NSString*)value;

- (NSString*)primitiveInstructions;
- (void)setPrimitiveInstructions:(NSString*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSNumber*)primitiveRealId;
- (void)setPrimitiveRealId:(NSNumber*)value;

- (int32_t)primitiveRealIdValue;
- (void)setPrimitiveRealIdValue:(int32_t)value_;

@end
