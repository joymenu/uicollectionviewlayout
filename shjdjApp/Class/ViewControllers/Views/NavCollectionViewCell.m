//
//  NavCollectionViewCell.m
//  shjdjApp
//
//  Created by bbu on 2/16/15.
//  Copyright (c) 2015 bbu. All rights reserved.
//

#import "NavCollectionViewCell.h"


@implementation NavCollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.iconImageView = [[UIImageView alloc] init];
        self.iconImageView.frame = CGRectMake(0, 0, 70 , 70);
        self.iconImageView.backgroundColor = [UIColor greenColor];
        
        [self.contentView addSubview:self.iconImageView];
    }
    
    return self;
}

@end
