//
//  MainViewController.m
//  shjdjApp
//
//  Created by bbu on 1/31/15.
//  Copyright (c) 2015 bbu. All rights reserved.
//

#import "MainViewController.h"
#import "TestView.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationItem.title = @"福音传道";
    
//    NSArray *test = @[@"aaa",@"bbb"];
    
//    NSString *str = [test componentsJoinedByString:@","];
//    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
    
    
//    TestView* tv = [[TestView alloc] initWithFrame:self.view.frame];
    
//    [self.view addSubview:tv];
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    UILabel *one = [[UILabel alloc] init];
    UILabel *two = [[UILabel alloc] init];
    UILabel *three = [[UILabel alloc] init];
    
    // Put some content in there for illustrations
    NSInteger labelNumber = 0;
    for (UILabel *label in @[one,two,three])
    {
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.backgroundColor = [UIColor redColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSString stringWithFormat:@"%ld",(long)labelNumber++];
        [self.view addSubview:label];
    }
    
    // Create the views and metrics dictionaries
    NSDictionary *metrics = @{@"height":@400.0};
    NSDictionary *views = NSDictionaryOfVariableBindings(one,two,three);
    
    // Horizontal layout - note the options for aligning the top and bottom of all views
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[one(two)]-[two(three)]-[three]-|" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:metrics views:views]];
    
    // Vertical layout - we only need one "column" of information because of the alignment options used when creating the horizontal layout
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[one(height)]-|" options:0 metrics:metrics views:views]];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
