//
//  AppState.h
//  TicTacToe
//
//  Created by Genry on 7/28/18.
//  Copyright © 2018 Genry. All rights reserved.
//

/**
 `AppState` class represents persistent application session
 */

@interface AppState : NSObject<NSCoding>

/**
  geting singleton, for convenient work with State
 */
+ (AppState *)sharedInstance;
/**
  saving board data and current symbol to file-system
 */
+ (BOOL)saveState;
/**
  restoring board data and current symbol from previously saved state
 */
+ (AppState *)restoreState;

/**
  current mark, 'O' or 'X'
 */
@property (nonatomic, copy) NSString *currentSymbol;
/**
  represents board object as two-dimensional array of strings. Inital empty cells are marked as '_'
 */
@property (nonatomic, strong) NSArray<NSMutableArray<NSString *> *> *board;

/**
  reset board object to initial state with all '_' cells. When new game just started
 */
- (void)reset;
@end
