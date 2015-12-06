//
//  ViewController3.m
//  RuntimeDemo
//
//  Created by litt1e-p on 15/12/5.
//  Copyright © 2015年 litt1e-p. All rights reserved.
//

#import "ViewController3.h"
#import "Message.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    [self sayHello:@"runtime3"];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *methodSignature = [super methodSignatureForSelector:aSelector];
    if (!methodSignature) {
        methodSignature = [Message instanceMethodSignatureForSelector:aSelector];
    }
    return methodSignature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    Message *message = [Message new];
    if ([message respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:message];
    }
}

@end
