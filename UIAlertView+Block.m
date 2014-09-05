//
//  UIAlertView+Block.m
//
//  Created by 日野森寛也 on 6/7/14.
//  Copyright (c) 2014 Hiroya Hinomori. All rights reserved.
//
//  This software is released under the MIT License.
//  http://opensource.org/licenses/mit-license.php
//

#import "UIAlertView+Block.h"

@implementation UIAlertView (Block)

static AlertTouchedBlock touchedBlock;

+ (id)alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:otherButtonTitles, nil];
    return alert;
}

- (void)showWithBlock:(AlertTouchedBlock)block
{
    touchedBlock = block;
    self.delegate = self;
    [self show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (touchedBlock) {
        touchedBlock(buttonIndex);
    }
}

- (void)dealloc
{
    AH_SUPER_DEALLOC;
}

@end
