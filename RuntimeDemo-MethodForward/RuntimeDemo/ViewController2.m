//
//  ViewController2.m
//  RuntimeDemo
//
//  Created by litt1e-p on 15/12/5.
//  Copyright © 2015年 litt1e-p. All rights reserved.
//

#import "ViewController2.h"
#import "Message.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    [self sayHello:@"runtime2"];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if (aSelector == @selector(sayHello:)) {
        return [Message new];// point to Class Message which implement SEL:sayHello:
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
