//
//  NavCollectionViewLayout.m
//  shjdjApp
//
//  Created by bbu on 2/20/15.
//  Copyright (c) 2015 bbu. All rights reserved.
//

#import "NavCollectionViewLayout.h"
#define MINIMUM_VISIBLE_CELLS_COUNT 3

@interface NavCollectionViewLayout ()
{
    NSArray *layoutArr;
    CGSize currentContentSize;
    NSMutableArray *roatationArr;
}

@end
@implementation NavCollectionViewLayout

-(id) init
{
    self = [super self];
    if (self) {
        roatationArr = [NSMutableArray new];
        for (NSInteger i =0; i <MINIMUM_VISIBLE_CELLS_COUNT; i++ ) {
            float randAngle = 0.4 * (arc4random() % 100) / 100.0 - 0.2;
            [roatationArr addObject:@(randAngle)];
        }
        roatationArr[0] = @0;
    
    }
    
    return self;
}
-(void)prepareLayout
{
    [super prepareLayout];
    layoutArr = [self generateLayout];
    
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return layoutArr;
}
-(CGSize) collectionViewContentSize
{
    return currentContentSize;
}
-(NSArray *)generateLayout
{
    NSMutableArray *arr = [NSMutableArray new];
    
    NSInteger sectionCount = 1;
    CGSize cellSize = self.cellSize;
    float collectionWidth = self.collectionView.bounds.size.width;
    
    float xOffset = 0.0;
    float yOffset = 0.0;
    
    if ([self.collectionView.dataSource respondsToSelector:@selector(numberOfSectionsInCollectionView:)]) {
        sectionCount = [self.collectionView.dataSource numberOfSectionsInCollectionView:self.collectionView];
    }
    for (NSInteger section =0; section < sectionCount; section++) {
        NSInteger itemCount = [self.collectionView.dataSource collectionView:self.collectionView numberOfItemsInSection:section];
        
        for (NSInteger item =0; item < itemCount; item++) {
            NSIndexPath *idxPath = [NSIndexPath indexPathForItem:item inSection:section];
            UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:idxPath];
            
            attrs.frame = CGRectMake(xOffset, yOffset, cellSize.width, cellSize.height);
            if (item < MINIMUM_VISIBLE_CELLS_COUNT) {
                float rotation = [roatationArr[item] floatValue];
                attrs.transform = CGAffineTransformMakeRotation(rotation);
                attrs.hidden = NO;
            } else {
                attrs.hidden = YES;
            }
            [arr addObject:attrs];
        }
        xOffset += cellSize.width + self.sectionSpacing.width;
        if (xOffset + cellSize.width > collectionWidth) {
            xOffset = 0;
            yOffset += cellSize.height + self.sectionSpacing.height;
        }
        
    }
    currentContentSize = CGSizeMake(xOffset, yOffset);
    return arr;
    
}

@end
