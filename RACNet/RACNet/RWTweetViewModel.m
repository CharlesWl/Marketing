//
//  RWTweetViewModel.m
//  RACNet
//
//  Created by charles on 16/6/29.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "RWTweetViewModel.h"

@implementation RWTweetViewModel
+ (RWTweetViewModel *)getWithRwtweet:(RWTweet *)rwtweet {
    RWTweetViewModel *viewModel = [RWTweetViewModel new];
    viewModel.name = [NSString stringWithFormat:@"王八蛋%@",rwtweet.username];
    viewModel.sexString = rwtweet.status ? @"男" : @"女";
    viewModel.imageUrl = [NSString stringWithFormat:@"%@.jpg",rwtweet.profileImageUrl];
    return viewModel;
}

@end
