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
        self.row1 = @(firstPoint.y + 1);
        self.col1 = @(firstPoint.x + 1);
        
        self.row2 = @(secondPoint.y + 1);
        self.col2 = @(secondPoint.x + 1);
    }
    return self;
}

@end
