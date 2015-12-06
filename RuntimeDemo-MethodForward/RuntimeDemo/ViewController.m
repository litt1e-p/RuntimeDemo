//
//  ViewController.m
//  RuntimeDemo
//
//  Created by litt1e-p on 15/12/5.
//  Copyright © 2015年 litt1e-p. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self sayHello:@"runtime"];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(sayHello:)) {
        class_addMethod([self class], sel, (IMP)say, "v@:@");//v@:@ --> void id SEL NSString
    }
    return [super resolveInstanceMethod:sel];
}

void say(id self, SEL _cmd, NSString *name)
{
    NSLog(@"hello %@", name);
}

@end
