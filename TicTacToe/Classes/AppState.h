//
//  AppState.h
//  TicTacToe
//
//  Created by Genry on 7/28/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppState : NSObject<NSCoding>

+ (AppState *)sharedInstance;
+ (BOOL)saveState;
+ (AppState *)restoreState;

@property (nonatomic, copy) NSString *currentSymbol;        // '_' 'O' 'X'
@property (nonatomic, strong) NSArray<NSMutableArray<NSString *> *> *board;

- (void)reset;
@end
