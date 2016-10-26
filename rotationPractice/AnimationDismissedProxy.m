//
//  AnimationDismissedProxy.m
//  rotationPractice
//
//  Created by shengli on 2016/10/23.
//  Copyright © 2016年 shenglishengli. All rights reserved.
//

#import "AnimationDismissedProxy.h"

@implementation AnimationDismissedProxy

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        if (fromView.transform.b > 0) {
            fromView.transform = CGAffineTransformMakeRotation(M_PI_2);
        } else {
            fromView.transform = CGAffineTransformMakeRotation(-M_PI_2);
        }
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}


@end
