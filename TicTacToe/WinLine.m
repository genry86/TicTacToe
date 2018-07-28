//
//  WinLine.m
//  TicTacToe
//
//  Created by Genry on 7/28/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import "WinLine.h"

@implementation WinLine

- (instancetype)initWithFirstPoint:(CGPoint)firstPoint andSecondPoint:(CGPoint)secondPoint;
{
    self = [super init];
    if (self) {
        self.row1 = @(firstPoint.y);
        self.col1 = @(firstPoint.x);
        
        self.row2 = @(secondPoint.y);
        self.col2 = @(secondPoint.x);
    }
    return self;
}

@end
