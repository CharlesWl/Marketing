//
//  ViewController.m
//  变换
//
//  Created by charles on 16/6/21.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation ViewController

CGAffineTransform CGAffineTransformMakeShear(CGFloat x, CGFloat y)
{
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform.c = -x;
    transform.b = y;
    return transform;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
    //self.layerView.transform = transform;
    //或者
    //self.layerView.layer.affineTransform = transform;
    //斜切
    //self.layerView.layer.affineTransform = CGAffineTransformMakeShear(1, 0);
    //初始化一个空的transform
//    [UIView animateWithDuration:1.0 animations:^{
//        CGAffineTransform transform = CGAffineTransformIdentity;
//        transform = CGAffineTransformScale(transform, .5, .5);
//        transform = CGAffineTransformRotate(transform, M_PI);
//        transform = CGAffineTransformTranslate(transform, 200, 200);
//        self.layerView.transform = transform;
//    }];
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = - 1.0 / 500.0;
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    self.layerView.layer.transform = transform;
}

@end
