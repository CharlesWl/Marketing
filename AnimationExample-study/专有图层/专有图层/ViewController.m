//
//  ViewController.m
//  专有图层
//
//  Created by charles on 16/6/22.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "ViewController.h"
#import "QQPulsingLayer.h"
#import "scaleLayer.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self doScaleAction];
    
    
    
    
    //[self drawHuoChaiRen];
    //[self userTextLayer];
}

- (void)doScaleAction {
    scaleLayer *scaleLa = [scaleLayer layer];
    scaleLa.bounds = CGRectMake(0, 0, 14, 14);
    scaleLa.position = CGPointMake(100, 40);
    CAReplicatorLayer *repLayer = [CAReplicatorLayer layer];
    repLayer.frame = CGRectMake(80, 130, 200, 200);
    repLayer.instanceCount = 15;
    repLayer.instanceDelay = 1.5/15;
    CGFloat angle = 2*M_PI/15;
    repLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    [repLayer addSublayer:scaleLa];
    [self.view.layer addSublayer:repLayer];
}


- (void)doMaiChong {
    QQPulsingLayer *bLayer = [QQPulsingLayer layer];
    bLayer.frame = CGRectMake(0, 0, 60, 60);
    bLayer.backgroundColor = [UIColor redColor].CGColor;
    bLayer.radius = 30;
    bLayer.animationDuration = 3.0;
    CAReplicatorLayer *repLayer = [CAReplicatorLayer layer];
    repLayer.instanceCount = 10;
    repLayer.instanceDelay = .3;
    [repLayer addSublayer:bLayer];
    [self.view.layer addSublayer:repLayer];
}

/**
 *  CAShapeLayer画图
 */
- (void)drawHuoChaiRen {
    //用CAShapeLayer画火柴人
    //贝塞尔曲线
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(175, 100)];
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];
    //creat shapeLayer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 3;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    [self.view.layer addSublayer:shapeLayer];
}

/**
 * CATextLayer渲染文本
 */
- (void)userTextLayer {
    //用CATextLayer写字
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:textLayer];
    
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    UIFont *font = [UIFont systemFontOfSize:15];
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    //choose some text
    NSString *text = @"《魔兽》是由美国传奇影业、暴雪娱乐联合出品的奇幻动作片，由邓肯·琼斯执导，崔维斯·费米尔、托比·凯贝尔、宝拉·巴顿、本·施耐泽、本·福斯特、吴彦祖、多米尼克·库珀、罗伯特·卡辛斯基联合主演。影片根据1994年暴雪娱乐制作的游戏《魔兽争霸：人类与兽人》改编，以人类联盟和兽人部落之间发生冲突为背景，讲述了黑暗之门打开之后，两个世界的种族为了各自的生存和家园奋起而战的故事。该片于2016年6月8日以2D、3D、IMAX3D、中国巨幕在中国大陆上映。并于2016年6月10日在美国上映";
    
    //set layer text
    textLayer.string = text;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
}
@end
