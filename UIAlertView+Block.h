//
//  UIAlertView+Block.h
//  MyUtil
//
//  Created by 日野森寛也 on 6/7/14.
//  Copyright (c) 2014 Baccass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Block)

typedef void (^AlertTouchedBlock)(NSInteger index);

+ (id)alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

- (void)showWithBlock:(AlertTouchedBlock)block;

@end
