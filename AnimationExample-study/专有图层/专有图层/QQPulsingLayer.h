//
//  QQPulsingLayer.h
//  QQing
//
//  Created by 王涛 on 16/4/27.
//
//

#import <QuartzCore/QuartzCore.h>

@interface QQPulsingLayer : CALayer
@property (nonatomic, assign) CGFloat radius;                       // default:60pt
@property (nonatomic, assign) NSTimeInterval animationDuration;     // default:3s
@property (nonatomic, assign) NSTimeInterval pulseInterval;         // default is 0s
@property (nonatomic, assign) int layerIndex;
@end
