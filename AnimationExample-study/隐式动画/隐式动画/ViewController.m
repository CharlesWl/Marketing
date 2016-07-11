//
//  ViewController.m
//  隐式动画
//
//  Created by charles on 16/6/27.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationView;
@property (nonatomic, strong) CALayer *colorLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    self.colorLayer.position = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
//    CATransition *transition = [CATransition animation];
//    transition.type = kCATransitionPush;
//    transition.subtype = kCATransitionFromLeft;
//    self.colorLayer.actions = @{@"backgroundColor": transition};
    [self.view.layer addSublayer:self.colorLayer];
    //[self performSelector:@selector(yinshiAnimation) withObject:nil afterDelay:2.0];
    
}

- (void)yinshiAnimation {
    //[CATransaction begin];
    //[CATransaction setAnimationDuration:2.0];
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
//    [CATransaction setCompletionBlock:^{
//        CGAffineTransform transform = CGAffineTransformIdentity;
//        transform = CGAffineTransformRotate(transform, M_PI_2);
//        self.colorLayer.affineTransform = transform;
//    }];
    //[CATransaction commit];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self.view];
    if ([self.colorLayer.presentationLayer hitTest:point]) {
        CGFloat red = arc4random() / (CGFloat)INT_MAX;
        CGFloat green = arc4random() / (CGFloat)INT_MAX;
        CGFloat blue = arc4random() / (CGFloat)INT_MAX;
        self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    } else {
        [CATransaction begin];
        [CATransaction setAnimationDuration:1.0];
        self.colorLayer.position = point;
        [CATransaction commit];
    }
}
@end
