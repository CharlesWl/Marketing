//
//  ViewController.m
//  显示动画
//
//  Created by charles on 16/7/4.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (nonatomic, strong) CALayer *colorLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)didClickOnChangeColor:(UIButton *)sender {
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
//    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
//    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
//    basicAnimation.toValue = (__bridge id _Nullable)(color.CGColor);
//    [self.layerView.layer addAnimation:basicAnimation forKey:nil];
//    self.layerView.layer.backgroundColor = color.CGColor;
    //画条贝塞尔曲线
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake([UIScreen mainScreen].bounds.size.width/2 +100, [UIScreen mainScreen].bounds.size.height/2)];
    [path addArcWithCenter:self.view.center radius:100 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor grayColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 3;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.duration = 2.0;
//    keyAnimation.values = @[(__bridge id)[UIColor blueColor].CGColor,
//                            (__bridge id)[UIColor redColor].CGColor,
//                            (__bridge id)[UIColor greenColor].CGColor,
//                            (__bridge id)[UIColor blueColor].CGColor];
    keyAnimation.path = path.CGPath;
    [self.layerView.layer addAnimation:keyAnimation forKey:nil];
}

@end
