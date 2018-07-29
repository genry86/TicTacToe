//
//  Constants.h
//  TicTacToe
//
//  Created by Genry on 7/28/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kBoardXCell;
extern NSString *const kBoardOCell;
extern NSString *const kBoardEmptyCell;

extern NSInteger const kBoardLimit;

typedef NS_ENUM(NSUInteger, StepStatus)
{
   StepStatusNextTurn = 0,
   StepStatusNoEmptyCells,
   StepStatusWin
};

@interface Constants : NSObject
@end
