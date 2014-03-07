//
//  YHAppDelegate.m
//  CustomButtonDemo
//
//  Created by aaron on 3/7/14.
//  Copyright (c) 2014 Pixel Egg. All rights reserved.
//

#import "YHAppDelegate.h"

@implementation YHAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)setButtonHeight:(id)sender{
    [sender setFrameSize:NSMakeSize(100, 100)];
}
@end
