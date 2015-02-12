//
//  TestView.m
//  shjdjApp
//
//  Created by bbu on 2/3/15.
//  Copyright (c) 2015 bbu. All rights reserved.
//

#import "TestView.h"

@implementation TestView
-(void)layoutSubviews
{
//    self.backgroundColor = [UIColor whiteColor];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect spRect         = CGRectMake(0 ,80, 70, 20);//坐标
    CGContextSetRGBFillColor(context, 255.0/255.0f, 255.0/255.0f, 255.0/255.0f,1);//颜色（RGB）,透明度
    CGContextFillRect(context, spRect);
    CGContextStrokePath(context);

//    CGContextStrokePath(context);
//    CGContextSetShouldAntialias(context, NO);

    
//    self.backgroundColor = [UIColor whiteColor];
}
@end
