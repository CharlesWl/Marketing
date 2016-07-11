//
//  RWTweetViewModel.h
//  RACNet
//
//  Created by charles on 16/6/29.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWTweet.h"
@interface RWTweetViewModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *sexString;
+ (RWTweetViewModel *)getWithRwtweet:(RWTweet *)rwtweet;
//+ (NSMutableArray *)getModels;
@end
