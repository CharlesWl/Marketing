//
//  scaleLayer.m
//  专有图层
//
//  Created by charles on 16/6/22.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "scaleLayer.h"
#import <UIKit/UIKit.h>
@implementation scaleLayer
- (instancetype)init {
    self = [super init];
    if (self) {
        self.contentsScale = [UIScreen mainScreen].scale;
        self.backgroundColor = [UIColor redColor].CGColor;
        [self setAnimation];
    }
    return self;
}

- (void)setAnimation {
    CABasicAnimation *basicAni = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    basicAni.fromValue = @(1.0);
    basicAni.toValue = @(0.1);
    basicAni.duration = 1.5;
    basicAni.repeatCount = INFINITY;
    [self addAnimation:basicAni forKey:nil];
}
@end
