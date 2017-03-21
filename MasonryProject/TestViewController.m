//
//  TestViewController.m
//  MasonryProject
//
//  Created by cocoa on 16/10/23.
//  Copyright © 2016年 cocoa. All rights reserved.
//

#define MAS_SHORTHAND

#import "TestViewController.h"
#import "Masonry.h"
#import "FourViewController.h"

@interface TestViewController ()
@property(strong,nonatomic) MASConstraint *constraint;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView* image = [[UIImageView alloc] init];
    [image setImage:[UIImage imageNamed:@"test_image"]];
    [self.view addSubview:image];
    
    UILabel *label1 = [[UILabel alloc] init];
    [label1 setText:@"label1"];
    [label1 setBackgroundColor:[UIColor cyanColor]];
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] init];
    [label2 setText:@"label2"];
    [label2 setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] init];
    [label3 setText:@"label3"];
    [self.view addSubview:label3];
    
    
    [image mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.mas_equalTo(0);
        make.top.equalTo(self.view).offset(100);
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
    
    [label1 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.top.equalTo(image.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    
    [label2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1.bottom).offset(20);
        make.left.equalTo(label1);
        make.width.equalTo(self.view).dividedBy(3);
        make.height.mas_equalTo(40);
    }];
    
    [label3 makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@30);
        make.left.right.bottom.equalTo(self.view).offset(30);
        make.left.equalTo(@30);
    }];
    
    [label2 updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1.bottom).offset(40);
        make.left.equalTo(@30);
    }];
    
    NSMutableArray *btnArray = [NSMutableArray arrayWithCapacity:3];
    for (int i=0; i< 3; i++) {
        UIButton *btn1 = [[UIButton alloc] init];
        [btn1 setBackgroundColor:[UIColor redColor]];
        [btn1 setTitle:[NSString stringWithFormat:@"btn%d",i] forState:UIControlStateNormal];
        [self.view addSubview:btn1];
        [btnArray addObject:btn1];
    }
    [btnArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:30 leadSpacing:15 tailSpacing:15];
    [btnArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label2.bottom).offset(30);
        make.height.equalTo(@30);
    }];
    
    
    UITextField *input = [[UITextField alloc] init];
    [input setPlaceholder:@"please enter"];
    [self.view addSubview:input];
    [input setBackgroundColor:[UIColor orangeColor]];
    
    [input mas_makeConstraints:^(MASConstraintMaker *make) {
        self.constraint = make.left.equalTo(self.view).offset(15);
        make.top.equalTo(btnArray).offset(100);
        make.size.mas_equalTo(CGSizeMake(200, 30));
    }];
   
    [btnArray[0] addTarget:self action:@selector(changeConstraint) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *transferBtn = [[UIButton alloc] init];
    [transferBtn setTitle:@"Next page" forState:UIControlStateNormal];
    [transferBtn setBackgroundColor:[UIColor blueColor]];
    [transferBtn addTarget:self action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:transferBtn];
    
    [transferBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.mas_equalTo(-60);
        make.right.mas_equalTo(-20);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];

}

- (void)nextPage:(id) sender{
    
    FourViewController *nextVC = [[FourViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
    
}

- (void)changeConstraint {
    self.constraint.offset = 100;
    [self.view layoutIfNeeded];
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
