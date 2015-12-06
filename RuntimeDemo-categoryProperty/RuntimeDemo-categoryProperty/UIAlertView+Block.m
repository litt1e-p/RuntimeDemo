//
//  UIAlertView+Block.m
//  RuntimeDemo-categoryProperty
//
//  Created by litt1e-p on 15/12/5.
//  Copyright © 2015年 litt1e-p. All rights reserved.
//

#import "UIAlertView+Block.h"
#import <objc/runtime.h>

@interface UIAlertView (Block)<UIAlertViewDelegate>

@end

@implementation UIAlertView (Block)

static char const AlertViewCompletionKey;

- (void)showAlertViewWithCompletion:(CompletionBlock)completion
{
    if (completion) {
        objc_removeAssociatedObjects(self);
        objc_setAssociatedObject(self, &AlertViewCompletionKey, completion, OBJC_ASSOCIATION_COPY);
        self.delegate = self;
    }
    [self show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    CompletionBlock block = objc_getAssociatedObject(self, &AlertViewCompletionKey);
    if (block) {
        block(buttonIndex);
    }
}

@end
