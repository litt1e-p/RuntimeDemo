//
//  ViewController.m
//  RuntimeDemo-categoryProperty
//
//  Created by litt1e-p on 15/12/5.
//  Copyright © 2015年 litt1e-p. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "UIAlertView+Block.h"

@interface NSObject (Associate)

@property (nonatomic, strong) id object;

@end

@implementation NSObject (Associate)

static char const *objectKey;

- (void)setObject:(id)object
{
    objc_setAssociatedObject(self, objectKey, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)object
{
    return objc_getAssociatedObject(self, objectKey);
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSObject *obj = [NSObject new];
    obj.object = @"Associate";
    NSLog(@"%@", obj.object);
    
    //another example
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Runtime" message:@"runtime associate" delegate:nil cancelButtonTitle:@"cancle" otherButtonTitles:@"ok", nil];
    [av showAlertViewWithCompletion:^(NSInteger buttonIndex) {
        NSLog(@"selected index: %ld", (long)buttonIndex);
    }];
}

@end
