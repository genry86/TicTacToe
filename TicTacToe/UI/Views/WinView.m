//
//  WinView.m
//  TicTacToe
//
//  Created by Genry on 7/28/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import "WinView.h"
#import "WinLine.h"

@interface WinView ()

@property (nonatomic, strong) WinLine *winLine;

@end

@implementation WinView

#pragma mark - View lifecycle
#pragma mark - 

- (id)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    if (!self.winLine) {
        return;
    }
    
    int halfCellSize = rect.size.width / 6;    // middle of one cell
    int cellSize = rect.size.width / 3;    // middle of one cell
    
    double startX = (self.winLine.col1.intValue - 1) * cellSize + halfCellSize;
    double startY = (self.winLine.row1.intValue - 1) * cellSize + halfCellSize;
    
    double endX = (self.winLine.col2.intValue - 1) * cellSize + halfCellSize;
    double endY = (self.winLine.row2.intValue - 1) * cellSize + halfCellSize;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    CGContextSetLineWidth(context, 10.0f);
    
    CGContextMoveToPoint(context, startX, startY); //start at this point
    CGContextAddLineToPoint(context, endX, endY); //draw to this point
    
    CGContextStrokePath(context);
}

#pragma mark - Public
#pragma mark -

- (void)drawLine:(WinLine *)winLine
{
    self.winLine = winLine;
    [self setNeedsDisplay];
}

@end
