//
//  AnimationPresentedProxy.m
//  rotationPractice
//
//  Created by shengli on 2016/10/23.
//  Copyright © 2016年 shenglishengli. All rights reserved.
//

#import "AnimationPresentedProxy.h"

@implementation AnimationPresentedProxy

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView];
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    [containerView addSubview:toView];
    
    toView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}


@end
