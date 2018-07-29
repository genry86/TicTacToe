//
//  GameBoard.h
//  TicTacToe
//
//  Created by Genry on 7/28/18.
//  Copyright © 2018 Genry. All rights reserved.
//

@class WinLine;

/**
 `GameBoard` class represents main game board
 */

@interface GameBoard : NSObject

/**
  geting singleton, for convenient work with board
 */
+ (GameBoard *)sharedInstance;

/**
 * `tapOnRow:andColumn:winLine` press on cell of board
 * @param row
 * row of recently pressed cell
 * @param column
 * column of recently pressed cell
 * @param winLine (inout)
 * successfully crossed line if exist or nil
 */
- (NSString *)tapOnRow:(NSUInteger)row andColumn:(NSUInteger)column winLine:(WinLine **)winLine;

/**
  checking if board still has empty cells to make next step
 */
- (BOOL)checkAbilityToTap;

@end
