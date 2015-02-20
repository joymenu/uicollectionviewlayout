//
//  NavCollectionViewCell.m
//  shjdjApp
//
//  Created by bbu on 2/16/15.
//  Copyright (c) 2015 bbu. All rights reserved.
//

#import "NavCollectionViewCell.h"


@implementation NavCollectionViewCell
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.iconImageView = [[UIImageView alloc] init];
    self.iconImageView.frame = CGRectMake(30, 66, 200, 200);
    [self.contentView addSubview:self.iconImageView];

}
@end
