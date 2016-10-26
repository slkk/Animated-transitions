//
//  ViewController.m
//  rotationPractice
//
//  Created by shengli on 2016/10/22.
//  Copyright © 2016年 shenglishengli. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"
#import "AnimationPresentedProxy.h"
#import "AnimationDismissedProxy.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    AnimationPresentedProxy *presentedProxy = [AnimationPresentedProxy new];
    return presentedProxy;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    AnimationDismissedProxy *dismissedProxy = [AnimationDismissedProxy new];
    return dismissedProxy;
}

- (IBAction)transitionButtonClick {
    
    TwoViewController *twoVC = [TwoViewController new];
    twoVC.modalPresentationStyle = UIModalPresentationCustom;
    twoVC.transitioningDelegate = self;
    [self presentViewController:twoVC animated:YES completion:nil];
}




@end
