//
//  YHTools.m
//  CustomButtonDemo
//
//  Created by aaron on 3/7/14.
//  Copyright (c) 2014 Pixel Egg. All rights reserved.
//

#import "YHTools.h"

void drawPixelAtPoint(NSPoint p){
    NSRect rect = NSMakeRect(p.x, p.y, 1, 1);
    NSRectFill(rect);
}