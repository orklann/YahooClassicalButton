//
//  YHButtonCellWhite.m
//  CustomButtonDemo
//
//  Created by aaron on 3/7/14.
//  Copyright (c) 2014 Pixel Egg. All rights reserved.
//

#import "YHButtonCellWhite.h"
#import "YHTools.h"

@implementation YHButtonCellWhite

- (void)drawBezelWithFrame:(NSRect)frame inView:(NSView *)controlView{
    
    frame.origin.x = 1;
    frame.size.width -= 3;
    frame.origin.y += 2;
    frame.size.height -= 3;
    
    [[NSGraphicsContext currentContext] setShouldAntialias:NO];
    
    /*= Draw 4 border lines with black color =*/
    NSInteger minX = NSMinX(frame);
    NSInteger maxX = NSMaxX(frame);
    NSInteger minY = NSMinY(frame);
    NSInteger maxY = NSMaxY(frame);
    
    NSBezierPath *borderPath = [NSBezierPath bezierPath];
    [borderPath moveToPoint:NSMakePoint(minX, minY + 2)];
    
    /* left border*/
    [borderPath lineToPoint:NSMakePoint(minX, maxY - 2)];
    [borderPath moveToPoint:NSMakePoint(minX + 2, maxY)];
    
    /* bottom border */
    [borderPath lineToPoint:NSMakePoint(maxX - 2, maxY)];
    [borderPath moveToPoint:NSMakePoint(maxX, maxY - 2)];
    
    /* right border */
    [borderPath lineToPoint:NSMakePoint(maxX, minY +2 )];
    [borderPath moveToPoint:NSMakePoint(maxX - 2, minY)];
    
    /*= top border =*/
    [borderPath lineToPoint:NSMakePoint(minX + 2, minY)];
    
    [borderPath closePath];
    
    [[NSColor blackColor] set];
    
    [borderPath stroke];
    
    /* 4 outter corrner points */
    NSPoint topLeft = NSMakePoint(minX + 1, minY + 1 - 1);
    NSPoint leftBottom = NSMakePoint(minX + 1, maxY - 1 - 1);
    NSPoint bottomRight = NSMakePoint(maxX - 1, maxY - 1 - 1);
    NSPoint rightTop = NSMakePoint(maxX - 1, minY + 1 - 1);
    
    /*= Draw inner background =*/
    NSRect innerRect = NSMakeRect(0,
                                  0,
                                  fabs(rightTop.x - topLeft.x) + 1,
                                  fabs(bottomRight.y - topLeft.y) + 1);
    innerRect.origin = topLeft;
    [[NSColor colorWithCalibratedRed:0.86 green: 0.88 blue: 0.91 alpha:1.0] set];
    NSRectFill(innerRect);
    
    
    /*= Draw 4 inner borders =*/
    NSPoint innerLeftTop = innerRect.origin;
    innerLeftTop.y += 1;
    NSPoint innerLeftBottom = NSMakePoint(NSMinX(innerRect), NSMaxY(innerRect));
    NSPoint innerRightBottom = NSMakePoint(NSMaxX(innerRect) - 1, NSMaxY(innerRect));
    NSPoint innerRightTop = NSMakePoint(NSMaxX(innerRect) - 1, NSMinY(innerRect) + 1);
    
    /*=
     = Draw button according to buttons state
     =
     */
    
    if ([self isHighlighted]) {
        [[NSColor colorWithCalibratedRed: 0.75 green: 0.72 blue: 0.74 alpha:1.0] set];
        
        /* draw top and left highlight inner borders */
        NSBezierPath *path = [NSBezierPath bezierPath];
        
        [path moveToPoint:innerLeftTop];
        [path lineToPoint:innerRightTop];
        [path moveToPoint:innerLeftTop];
        [path lineToPoint:innerLeftBottom];
        [path closePath];
        [path stroke];
        
        /* draw bottom and right inner borders */
        [[NSColor colorWithCalibratedRed: 0.96 green: 0.96 blue: 0.97 alpha:1.0] set];
        path = [NSBezierPath bezierPath];
        [path moveToPoint:innerRightBottom];
        [path lineToPoint:innerLeftBottom];
        [path moveToPoint:innerRightBottom];
        [path lineToPoint:innerRightTop];
        [path closePath];
        [path stroke];
    }else{
        [[NSColor colorWithCalibratedRed: 0.96 green: 0.96 blue: 0.97 alpha:1.0] set];
        /* draw top and left highlight inner borders */
        NSBezierPath *path = [NSBezierPath bezierPath];
        
        [path moveToPoint:innerLeftTop];
        [path lineToPoint:innerRightTop];
        [path moveToPoint:innerLeftTop];
        [path lineToPoint:innerLeftBottom];
        [path closePath];
        [path stroke];
        
        /* draw bottom and right inner borders */
        [[NSColor colorWithCalibratedRed: 0.75 green: 0.72 blue: 0.74 alpha:1.0] set];
        path = [NSBezierPath bezierPath];
        [path moveToPoint:innerRightBottom];
        [path lineToPoint:innerLeftBottom];
        [path moveToPoint:innerRightBottom];
        [path lineToPoint:innerRightTop];
        [path closePath];
        [path stroke];
    }
    
    /*= Draw 4 corner pixels
     = Why we need to -1 to Y below? *_*
     =*/
    
    [[NSColor blackColor] set];
    
    drawPixelAtPoint(topLeft);
    drawPixelAtPoint(leftBottom);
    drawPixelAtPoint(bottomRight);
    drawPixelAtPoint(rightTop);
    
    [[NSGraphicsContext currentContext] setShouldAntialias:YES];
}

@end
