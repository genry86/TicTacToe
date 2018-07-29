//
//  UIButtonsUtilityTests.m
//  TicTacToeTests
//
//  Created by Genry on 7/29/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIButton+BoardCell.h"

@interface UIButtonsUtilityTests : XCTestCase

@end

@implementation UIButtonsUtilityTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}


- (void)testExample
{
    // GIVEN
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = 32;
    
    // WHEN
    CGPoint point = button.getCellCoords;
    
    // THEN
    XCTAssertEqual(point.y, 3);
    XCTAssertEqual(point.x, 2);
}

@end
