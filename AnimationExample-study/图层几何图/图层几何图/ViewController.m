//
//  ViewController.m
//  图层几何图
//
//  Created by charles on 16/6/17.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *zhongView;
@property (weak, nonatomic) IBOutlet UIView *hourView;
@property (weak, nonatomic) IBOutlet UIView *minutesView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UIView *lastBlueView;
@property (nonatomic, strong) CALayer *redLayer;
@property (nonatomic, weak) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.redView.layer.anchorPoint = CGPointMake(0, 0);
    //让蓝色view在最上面
    self.blueView.layer.zPosition = 1.0f;
    //NSLog(@"anchorPointX:%f,anchorPointY:%f",self.redView.layer.position.x,self.redView.layer.position.y);
    self.zhongView.layer.cornerRadius = 100;
    self.zhongView.clipsToBounds = YES;
    self.secondView.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.minutesView.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.hourView.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    //set initial hand positions
    [self tick];
    
    //layer响应点击事件
    self.redLayer = [CALayer layer];
    self.redLayer.frame = CGRectMake(20.0f, 20.0f, 100.0f, 100.0f);
    self.redLayer.backgroundColor = [UIColor redColor].CGColor;
    //add it to our view
    [self.lastBlueView.layer addSublayer:self.redLayer];
}

- (void)tick {
    //convert time to hours, minutes and seconds
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger units = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2.0;
    //calculate hour hand angle //calculate minute hand angle
    CGFloat minsAngle = (components.minute / 60.0) * M_PI * 2.0;
    //calculate second hand angle
    CGFloat secsAngle = (components.second / 60.0) * M_PI * 2.0;
    //rotate hands
    self.hourView.transform = CGAffineTransformMakeRotation(hoursAngle);
    self.minutesView.transform = CGAffineTransformMakeRotation(minsAngle);
    self.secondView.transform = CGAffineTransformMakeRotation(secsAngle);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
     CGPoint point = [[touches anyObject] locationInView:self.view];
    point = [self.lastBlueView.layer convertPoint:point fromLayer:self.view.layer];
    if ([self.lastBlueView.layer containsPoint:point]) {
        point = [self.redLayer convertPoint:point toLayer:self.lastBlueView.layer];
        if ([self.redLayer containsPoint:point]) {
            [[[UIAlertView alloc] initWithTitle:@"你点击的是红色的Layer"
                                        message:nil
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
        } else {
            [[[UIAlertView alloc] initWithTitle:@"你点击的是蓝色的Layer"
                                        message:nil
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
        }
    }
}

@end
