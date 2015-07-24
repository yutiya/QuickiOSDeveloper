//
//  BackGesture.m
//  TestD
//
//  Created by admin on 15/6/10.
//  Copyright (c) 2015年 Pandora. All rights reserved.
//

#import "UIViewController+BackGesture.h"

@implementation UIViewController (BackGesture)

- (void)addBackGesture
{
    if(self.navigationController != nil && self.navigationController.viewControllers.count > 1){
        UIGestureRecognizer *gesture = self.navigationController.interactivePopGestureRecognizer;
        gesture.enabled = NO;
        UIView *gestureView = gesture.view;
        /**
         *  获取系统手势的target数组
         */
        NSMutableArray *_targets = [gesture valueForKey:@"_targets"];
        /**
         *  获取它的唯一对象，我们知道它是一个叫UIGestureRecognizerTarget的私有类，它有一个属性叫_target
         */
        id gestureRecognizerTarget = [_targets firstObject];
        /**
         *  获取_target:_UINavigationInteractiveTransition，它有一个方法叫handleNavigationTransition:
         */
        id navigationInteractiveTransition = [gestureRecognizerTarget valueForKey:@"_target"];
        /**
         *  通过前面的打印，我们从控制台获取出来它的方法签名。
         */
        SEL handleTransition = NSSelectorFromString(@"handleNavigationTransition:");
        /**
         *  创建一个与系统一模一样的手势，我们只把它的类改为UIPanGestureRecognizer
         */
        UIPanGestureRecognizer *popRecognizer = [[UIPanGestureRecognizer alloc] init];
        [gestureView addGestureRecognizer:popRecognizer];
        [popRecognizer addTarget:navigationInteractiveTransition action:handleTransition];
    }
}

@end
