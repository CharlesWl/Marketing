//
//  buttonLayer.m
//  Animation
//
//  Created by charles on 16/6/12.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "buttonLayer.h"

@implementation buttonLayer

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupAnimationGroup];
    }
    return self;
}

- (void)setRadius:(CGFloat)radius {
    
    _radius = radius;
    
    CGPoint tempPos = self.position;
    
    CGFloat diameter = self.radius * 2;
    
    self.bounds = CGRectMake(0, 0, diameter, diameter);
    self.cornerRadius = self.radius;
    self.position = tempPos;
}

- (void)setupAnimationGroup {
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
    basicAnimation.fromValue = @0.0;
    basicAnimation.toValue = @1.0;
    basicAnimation.duration = self.animationDuration;
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    keyFrameAnimation.values = @[@0.45, @0.5, @0];
    keyFrameAnimation.keyTimes = @[@0, @0.5, @1];
    self.opacity = 0;
    keyFrameAnimation.duration = self.animationDuration;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.beginTime = CACurrentMediaTime();
    animationGroup.duration = self.animationDuration;
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    animationGroup.repeatCount = HUGE_VALF;
    animationGroup.removedOnCompletion = YES;
    animationGroup.animations = @[basicAnimation, keyFrameAnimation];
    [self addAnimation:animationGroup forKey:nil];
}
@end
