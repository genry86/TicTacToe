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

typedef NS_ENUM(NSUInteger, TTCellPos){
   TTCellPosLeftTop = 1,
   TTCellPosMiddleTop,
   TTCellPosRightTop,
   TTCellPosLeftMiddle,
   TTCellPosCenter,
   TTCellPosRightMiddle,
   TTCellPosLeftBottom,
   TTCellPosMiddleBottom,
   TTCellPosRightBottom
};

@interface Constants : NSObject
@end
