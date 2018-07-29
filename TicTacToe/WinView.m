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

- (id)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
    }
    return self;
}

- (void)drawLine:(WinLine *)winLine
{
    self.winLine = winLine;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    if (!self.winLine) {
        return;
    }
    
    int unit = rect.size.width / 6;    // middle of one cell
    
    double startX = self.winLine.col1.intValue * unit;
    double startY = self.winLine.row1.intValue * unit;
    
    double endX = self.winLine.col2.intValue * unit;
    double endY = self.winLine.row2.intValue * unit;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    CGContextSetLineWidth(context, 2.0f);
    
    CGContextMoveToPoint(context, startX, startY); //start at this point
    CGContextAddLineToPoint(context, endX, endY); //draw to this point
    
    CGContextStrokePath(context);
}


@end
