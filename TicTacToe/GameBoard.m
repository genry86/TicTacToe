//
//  GameBoard.m
//  TicTacToe
//
//  Created by Genry on 7/28/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import "GameBoard.h"
#import "WinLine.h"

@implementation GameBoard

+ (GameBoard *)sharedInstance
{
    static GameBoard *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[GameBoard alloc] init];
    });
    return instance;
}

- (void)tapOnRow:(NSUInteger)row andColumn:(NSUInteger)column winLine:(WinLine **)winLine
{
    AppState.sharedInstance.board[row][column] = AppState.sharedInstance.currentSymbol;
    
    *winLine = [GameBoard.sharedInstance checkWinLine];
    if (*winLine) {
        return;
    }
    
    if (![self checkAbilityToTap]) {
        return;
    }
    
    AppState.sharedInstance.currentSymbol = [AppState.sharedInstance.currentSymbol isEqualToString:kBoardXCell] ? kBoardOCell : kBoardXCell;
}

- (WinLine *)checkWinLine
{
    WinLine *winLine = [self checkStrateLines];
    winLine = winLine ?: [self checkDiagonalLines];
    
    return winLine;
}

- (WinLine *)checkStrateLines
{
    NSString *symbol = AppState.sharedInstance.currentSymbol;
    NSArray *board = AppState.sharedInstance.board;
    
    int horLineCells, verLineCells;
    
    for (int i = 0; i < kBoardLimit; i++)
    {
        horLineCells = 0;
        verLineCells = 0;
        
        for (int j = 0; j < kBoardLimit; j++)
        {
            if (board[i][j] == symbol) {
                horLineCells++;
            }
            if (board[j][i] == symbol) {
                verLineCells++;
            }
        }
        
        if (horLineCells == kBoardLimit) {
            return [WinLine.alloc initWithFirstPoint:CGPointMake(0, i) andSecondPoint:CGPointMake(kBoardLimit - 1, i)];
        }
        if (verLineCells == kBoardLimit) {
            return [WinLine.alloc initWithFirstPoint:CGPointMake(i, 0) andSecondPoint:CGPointMake(i, kBoardLimit - 1)];
        }
    }
    
    return nil;
}

- (WinLine *)checkDiagonalLines
{
    NSString *symbol = AppState.sharedInstance.currentSymbol;
    NSArray *board = AppState.sharedInstance.board;
    
    int leftDig = 0, rightDig = 0;
    for (int i = 0; i < kBoardLimit; i++)
    {
        if (board[i][i] == symbol) {
            leftDig++;
        }
        if (board[i][kBoardLimit - 1 - i] == symbol ) {
            rightDig++;
        }
    }
    
    if (leftDig == kBoardLimit) {
        return [WinLine.alloc initWithFirstPoint:CGPointMake(0, 0) andSecondPoint:CGPointMake(kBoardLimit - 1, kBoardLimit - 1)];
    }
    if (rightDig == kBoardLimit) {
        return [WinLine.alloc initWithFirstPoint:CGPointMake(kBoardLimit - 1, 0) andSecondPoint:CGPointMake(0, kBoardLimit - 1)];
    }
    return nil;
}


- (BOOL)checkAbilityToTap
{
    NSArray *board = AppState.sharedInstance.board;
    
    __block BOOL ableToTap = NO;
    [board enumerateObjectsUsingBlock:^(NSMutableArray<NSString *> *row, NSUInteger idx, BOOL *stop)
    {
        [row enumerateObjectsUsingBlock:^(NSString *symbol, NSUInteger idx, BOOL *stop)
        {
            if ([symbol isEqualToString:kBoardEmptyCell]) {
                *stop = ableToTap = YES;
            }
        }];
    }];
    
    return ableToTap;
}

@end
