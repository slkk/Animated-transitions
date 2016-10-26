//
//  TwoViewController.m
//  rotationPractice
//
//  Created by shengli on 2016/10/23.
//  Copyright © 2016年 shenglishengli. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)loadView {
    
    self.view = [UIView new];
    self.view.backgroundColor = [UIColor blueColor];
    self.view.layer.anchorPoint = CGPointMake(0.5, 2);
    self.view.frame = [UIScreen mainScreen].bounds;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
    [self.view addGestureRecognizer:pan];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)panGestureRecognizer:(UIPanGestureRecognizer *)recognizer {
    
    if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
        
        if (ABS(recognizer.view.transform.b) > 0.23) {
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            [UIView animateWithDuration:0.25 animations:^{
                recognizer.view.transform = CGAffineTransformIdentity;
            }];
        }
    } else {
        NSLog(@"a--%f,b--%f,c--%f,d--%f",recognizer.view.transform.a,recognizer.view.transform.b,recognizer.view.transform.c,recognizer.view.transform.d);
        
        CGFloat offsetX = [recognizer translationInView:recognizer.view].x;
        CGFloat persent = offsetX / self.view.bounds.size.width;
        CGFloat angle = persent * M_PI_4;
        
        recognizer.view.transform = CGAffineTransformMakeRotation(angle);
    }
    
    
}

@end
