//
//  AppState.m
//  TicTacToe
//
//  Created by Genry on 7/28/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import "AppState.h"

@implementation AppState

+ (AppState *)sharedInstance
{
    static AppState *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = AppState.alloc.init;
    });
    return instance;
}

#pragma mark - View lifecycle
#pragma mark -

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self reset];
    }
    return self;
}

#pragma mark - NSCoding
#pragma mark -

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.currentSymbol = [decoder decodeObjectForKey:@"currentSymbol"];
        self.board         = [decoder decodeObjectForKey:@"board"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.currentSymbol forKey:@"currentSymbol"];
    [encoder encodeObject:self.board         forKey:@"board"];
}

#pragma mark - Public
#pragma mark -

+ (BOOL)saveState
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = paths[0];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:NSStringFromClass(AppState.class)];
    
    return [NSKeyedArchiver archiveRootObject:AppState.sharedInstance toFile:appFile];
}

+ (BOOL)restoreState
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = paths[0];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:NSStringFromClass(AppState.class)];
    
    AppState *restorredState = [NSKeyedUnarchiver unarchiveObjectWithFile:appFile];
    if (restorredState && restorredState.board && restorredState.currentSymbol) {
        AppState.sharedInstance.board = restorredState.board;
        AppState.sharedInstance.currentSymbol = restorredState.currentSymbol;
        return YES;
    }
    
    return NO;
}

+ (BOOL)removeState
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = paths[0];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:NSStringFromClass(AppState.class)];
    
    NSError *err;
    [[NSFileManager defaultManager] removeItemAtPath:appFile error:&err];
    return YES;
}

- (void)reset
{
    self.board = @[
                   @[ @"_", @"_", @"_"].mutableCopy,
                   @[ @"_", @"_", @"_"].mutableCopy,
                   @[ @"_", @"_", @"_"].mutableCopy
                   ];
    
    self.currentSymbol = nil;
}


@end
