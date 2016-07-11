//
//  ViewController.m
//  视觉效果
//
//  Created by charles on 16/6/20.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *grayView;
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIImageView *zhentouIV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //enable layer shadows
    self.grayView.layer.shadowOpacity = 0.5f;
    self.redView.layer.shadowOpacity = 0.5f;
    
    //create a square shadow
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, self.grayView.bounds);
    self.grayView.layer.shadowPath = squarePath; CGPathRelease(squarePath);
    
    //create a circular shadow
    self.redView.layer.cornerRadius = 60 ;
    //self.redView.layer.masksToBounds = YES;
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, self.redView.bounds);
    self.redView.layer.shadowPath = circlePath; CGPathRelease(circlePath);
    
    //蒙版图层
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = self.zhentouIV.bounds;
    maskLayer.shadowOpacity = 1.0;
    maskLayer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    //寄宿图
    UIImage *maskImage = [UIImage imageNamed:@"DSC01960.png"];
    maskLayer.contents = (__bridge id)maskImage.CGImage;
    self.zhentouIV.layer.mask = maskLayer;
}


@end
