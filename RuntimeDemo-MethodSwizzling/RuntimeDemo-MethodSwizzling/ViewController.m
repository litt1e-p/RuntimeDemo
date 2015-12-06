//
//  ViewController.m
//  RuntimeDemo-MethodSwizzling
//
//  Created by litt1e-p on 15/12/5.
//  Copyright © 2015年 litt1e-p. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originSel = @selector(originFunc);
        SEL swizzlingSel = @selector(swizzlingFunc);
        
        Method originMethod = class_getInstanceMethod(self, originSel);
        Method swizzlingMethod = class_getInstanceMethod(self, swizzlingSel);
        
        BOOL methodAdded = class_addMethod(self, originSel, method_getImplementation(swizzlingMethod), method_getTypeEncoding(swizzlingMethod));
        if (methodAdded) {
            class_replaceMethod(self, swizzlingSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        } else {
            method_exchangeImplementations(originMethod, swizzlingMethod);
        }
        /** methodAdd will add sucessfully only in situation that originSel belong to super class */
    });
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self originFunc];
}

- (void)originFunc
{
    NSLog(@"%s", __func__);
}

- (void)swizzlingFunc
{
    NSLog(@"%s", __func__);
    [self swizzlingFunc];
}

@end
