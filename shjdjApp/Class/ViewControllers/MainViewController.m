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
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
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
    [cell.iconImageView setImage:[UIImage imageNamed:@"1"]];
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
