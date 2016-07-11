//
//  RWTweetCell.m
//  RACNet
//
//  Created by charles on 16/6/23.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "RWTweetCell.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface RWTweetCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headIV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end


@implementation RWTweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [RACObserve(self, self.rwtweetViewmodel) subscribeNext:^(RWTweetViewModel *rwtweetViewmodel) {
        self.headIV.image = [UIImage imageNamed:rwtweetViewmodel.imageUrl];
        self.nameLabel.text = rwtweetViewmodel.name;
        self.timeLabel.text = rwtweetViewmodel.sexString;
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
