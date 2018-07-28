//
//  AppStateTests.m
//  TicTacToeTests
//
//  Created by Genry on 7/28/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AppStateTests : XCTestCase

@end

@implementation AppStateTests

- (void)setUp {
    [super setUp];
}

- (void)test01CheckIfAppStateSaved
{
    // GIVEN
    BOOL isSuccessful = NO;
    AppState.sharedInstance.board[1][1] = kBoardXCell;
    
    // WHEN
    isSuccessful = [AppState saveState];
    
    // THEN
    XCTAssertTrue(isSuccessful);
}

- (void)test02CheckIfBoardReseted
{
    // GIVEN
    NSArray *expectedEmptyBoard = @[
                                    @[ @"_", @"_", @"_"].mutableCopy,
                                    @[ @"_", @"_", @"_"].mutableCopy,
                                    @[ @"_", @"_", @"_"].mutableCopy
                                    ];
    
    // WHEN
    AppState.sharedInstance.board[1][1] = kBoardXCell;
    [AppState.sharedInstance reset];
    
    // THEN
    __block BOOL isEqual = YES;
    [AppState.sharedInstance.board enumerateObjectsUsingBlock:^(NSMutableArray<NSString *> *row, NSUInteger idx, BOOL *stop)
    {
        isEqual = [row isEqualToArray:expectedEmptyBoard[idx]];
        if (!isEqual) {
            *stop = YES;
        }
    }];
    XCTAssertTrue(isEqual);
}

- (void)test03CheckIfSavedStateProperlyLoaded
{
    // GIVEN
    AppState.sharedInstance.board[1][1] = kBoardXCell;
    NSArray *expectedModifiedState = AppState.sharedInstance.board;
    
    // WHEN
    [AppState saveState];
    [AppState.sharedInstance reset];
    [AppState restoreState];
    
    // THEN
    __block BOOL isEqual = YES;
    [AppState.sharedInstance.board enumerateObjectsUsingBlock:^(NSMutableArray<NSString *> *row, NSUInteger idx, BOOL *stop)
     {
         isEqual = [row isEqualToArray:expectedModifiedState[idx]];
         if (!isEqual) {
             *stop = YES;
         }
     }];
    XCTAssertTrue(isEqual);
}
@end
