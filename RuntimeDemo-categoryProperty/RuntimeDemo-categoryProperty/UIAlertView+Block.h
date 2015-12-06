//
//  UIAlertView+Block.h
//  RuntimeDemo-categoryProperty
//
//  Created by litt1e-p on 15/12/5.
//  Copyright © 2015年 litt1e-p. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CompletionBlock) (NSInteger buttonIndex);

@interface UIAlertView (Block)

- (void)showAlertViewWithCompletion:(CompletionBlock)completion;

@end
