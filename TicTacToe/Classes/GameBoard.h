//
//  GameBoard.h
//  TicTacToe
//
//  Created by Genry on 7/28/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WinLine.h"

@interface GameBoard : NSObject

+ (GameBoard *)sharedInstance;

- (NSString *)tapOnRow:(NSUInteger)row andColumn:(NSUInteger)column winLine:(WinLine **)winLine;
- (BOOL)checkAbilityToTap;

@end
