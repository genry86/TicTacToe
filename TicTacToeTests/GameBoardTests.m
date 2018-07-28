//
//  GameBoardTests.m
//  TicTacToeTests
//
//  Created by Genry on 7/28/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "WinLine.h"
#import "GameBoard+Private.h"

@interface GameBoardTests : XCTestCase

@end

@implementation GameBoardTests

- (void)setUp {
    [super setUp];
    
    AppState.sharedInstance.currentSymbol = kBoardXCell;
}

- (void)test01CheckAbilityToDoStep
{
    // GIVEN
    WinLine *winLine;
    
    // WHEN
    [GameBoard.sharedInstance tapOnRow:1 andColumn:1 winLine:&winLine];     // _ _ _
                                                                            // _ X _
                                                                            // _ _ _
    
    // THEN
    XCTAssertTrue(GameBoard.sharedInstance.checkAbilityToTap);
}


- (void)test02CheckIfSymbolIsChangedAfterStep
{
    // GIVEN
    WinLine *winLine;
    
    // WHEN
    [GameBoard.sharedInstance tapOnRow:1 andColumn:1 winLine:&winLine];     // _ _ _
                                                                            // _ X _
                                                                            // _ _ _
    // THEN
    XCTAssertEqual(AppState.sharedInstance.currentSymbol, kBoardOCell);
}

- (void)test3CheckIfSymbolIsChangedAfterStep
{
    // GIVEN
    WinLine *winLine;
    
    // WHEN
    [GameBoard.sharedInstance tapOnRow:1 andColumn:1 winLine:&winLine];     // _ _ _
                                                                            // _ X _
                                                                            // _ _ _
    
    // THEN
    XCTAssertEqual(AppState.sharedInstance.currentSymbol, kBoardOCell);
}

- (void)test04CheckIfNoWinnersByDefault
{
    // GIVEN
    [AppState.sharedInstance reset];
    
    // WHEN
    WinLine *winLine;
    [GameBoard.sharedInstance tapOnRow:1 andColumn:1 winLine:&winLine];     // _ _ _
                                                                            // _ X _
                                                                            // _ _ _
    
    // THEN
    XCTAssertNil(winLine);
}

- (void)test5CheckIfBoardHasNoWrongWinner
{
    // GIVEN
    WinLine *winLine;
    
    // WHEN
    [GameBoard.sharedInstance tapOnRow:1 andColumn:0 winLine:&winLine];     // _ _ _
                                                                            // X _ _
                                                                            // _ _ _
    
    [GameBoard.sharedInstance tapOnRow:1 andColumn:1 winLine:&winLine];     // _ _ _
                                                                            // X O _
                                                                            // _ _ _
    
    [GameBoard.sharedInstance tapOnRow:1 andColumn:2 winLine:&winLine];     // _ _ _
                                                                            // X O _
                                                                            // _ _ _

    // THEN
    XCTAssertNil(winLine);
}

- (void)test6CheckIfBoardHasWinnerWithHorizontalLine
{
    // GIVEN
    WinLine *winLine;
    
    // WHEN
    [GameBoard.sharedInstance tapOnRow:1 andColumn:0 winLine:&winLine];     // _ _ _
                                                                            // X _ _
                                                                            // _ _ _
    
    [GameBoard.sharedInstance tapOnRow:2 andColumn:1 winLine:&winLine];     // _ _ _
                                                                            // X _ _
                                                                            // _ O _
    
    [GameBoard.sharedInstance tapOnRow:1 andColumn:1 winLine:&winLine];     // _ _ _
                                                                            // X X _
                                                                            // _ O _
    
    [GameBoard.sharedInstance tapOnRow:0 andColumn:1 winLine:&winLine];     // _ O _
                                                                            // X X _
                                                                            // _ O _
    
    [GameBoard.sharedInstance tapOnRow:1 andColumn:2 winLine:&winLine];     // _ O _
                                                                            // X X X
                                                                            // _ O _
    
    // THEN
    XCTAssertNotNil(winLine);
    
    XCTAssertTrue(winLine.row1.intValue ==  1);
    XCTAssertTrue(winLine.col1.intValue ==  0);
    XCTAssertTrue(winLine.row2.intValue ==  1);
    XCTAssertTrue(winLine.col2.intValue ==  2);
}

- (void)test7CheckIfBoardHasWinnerWithVerticalLine
{
    // GIVEN
    WinLine *winLine;
    
    // WHEN
    [GameBoard.sharedInstance tapOnRow:1 andColumn:2 winLine:&winLine];     // _ _ _
                                                                            // _ _ X
                                                                            // _ _ _
    
    [GameBoard.sharedInstance tapOnRow:2 andColumn:1 winLine:&winLine];     // _ _ _
                                                                            // _ _ X
                                                                            // _ O _
    
    [GameBoard.sharedInstance tapOnRow:0 andColumn:2 winLine:&winLine];     // _ _ X
                                                                            // _ _ X
                                                                            // _ O _
    
    [GameBoard.sharedInstance tapOnRow:0 andColumn:1 winLine:&winLine];     // _ O X
                                                                            // _ _ X
                                                                            // _ O _
    
    [GameBoard.sharedInstance tapOnRow:2 andColumn:2 winLine:&winLine];     // _ O X
                                                                            // _ _ X
                                                                            // _ O X
    
    // THEN
    XCTAssertNotNil(winLine);
    
    XCTAssertTrue(winLine.row1.intValue ==  0);
    XCTAssertTrue(winLine.col1.intValue ==  2);
    XCTAssertTrue(winLine.row2.intValue ==  2);
    XCTAssertTrue(winLine.col2.intValue ==  2);
}

- (void)test8CheckIfBoardHasWinnerWithDiagonalLine
{
    // GIVEN
    WinLine *winLine;
    
    // WHEN
    [GameBoard.sharedInstance tapOnRow:0 andColumn:2 winLine:&winLine];     // _ _ X
                                                                            // _ _ _
                                                                            // _ _ _
    
    [GameBoard.sharedInstance tapOnRow:1 andColumn:2 winLine:&winLine];     // _ _ X
                                                                            // _ _ O
                                                                            // _ _ _
    
    [GameBoard.sharedInstance tapOnRow:1 andColumn:1 winLine:&winLine];     // _ _ X
                                                                            // _ X O
                                                                            // _ _ _
    
    [GameBoard.sharedInstance tapOnRow:2 andColumn:1 winLine:&winLine];     // _ _ X
                                                                            // _ X O
                                                                            // _ O _
    
    [GameBoard.sharedInstance tapOnRow:2 andColumn:0 winLine:&winLine];     // _ _ X
                                                                            // _ X O
                                                                            // X O _
    
    // THEN
    XCTAssertNotNil(winLine);
    
    XCTAssertTrue(winLine.row1.intValue ==  0);
    XCTAssertTrue(winLine.col1.intValue ==  2);
    XCTAssertTrue(winLine.row2.intValue ==  2);
    XCTAssertTrue(winLine.col2.intValue ==  0);
}
@end
