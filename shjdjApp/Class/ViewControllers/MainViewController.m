//
//  MainViewController.m
//  shjdjApp
//
//  Created by bbu on 1/31/15.
//  Copyright (c) 2015 bbu. All rights reserved.
//

#import "MainViewController.h"
#import "NavCollectionViewCell.h"

@interface MainViewController ()
<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) NSMutableArray* dataArr;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [NSMutableArray new];
    
    for (NSInteger i =0; i< 3;i++) {
        NSMutableArray *sectionArr = [NSMutableArray new];
        for (NSInteger j =1; j<6; j++) {
            NSString *imageName = [NSString stringWithFormat:@"%ld",(long)(i * 5 + j)];
            [sectionArr addObject:imageName];
        }
        [self.dataArr addObject:sectionArr];
    }
    
    
    //初始化
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.collectionView = [[UICollectionView alloc]
                                        initWithFrame:CGRectMake(0, 66, self.view.bounds.size.width ,self.view.bounds.size.height)
                                        collectionViewLayout:flowLayout];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    //注册
    [self.collectionView registerClass:[NavCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    //设置代理
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    

}
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArr.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{    
    return [self.dataArr[section] count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NavCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    cell.iconImageView.image = [UIImage imageNamed:@"1"];
    NSLog(@"%@",cell);
    [cell.iconImageView setImage:[UIImage imageNamed:@"1"]];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //NSLog(@"%f",(kDeviceHeight-88-49)/4.0);
    return CGSizeMake(70 ,70);
}

////设置元素的的大小框
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets top = {5,10,15,5};
    return top;
}

//设置顶部的大小
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    CGSize size={0,0};
//    return size;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
