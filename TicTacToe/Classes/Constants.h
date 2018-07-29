//
//  Constants.h
//  TicTacToe
//
//  Created by Genry on 7/28/18.
//  Copyright © 2018 Genry. All rights reserved.
//

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

typedef void(^CompletionBlock)(void);

extern NSString *const kXImageUrl;
extern NSString *const kOImageUrl;

@interface Constants : NSObject
@end
