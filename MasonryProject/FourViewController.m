//
//  TestMasonryViewController.m
//  MasonryProject
//
//  Created by cocoa on 17/3/16.
//  Copyright © 2017年 cocoa. All rights reserved.
//

#define MAS_SHORTHAND

#import "FourViewController.h"
#import <Masonry.h>


@interface FourViewController ()

@end

@implementation FourViewController {
    UIView *_grayView;
    UIView *_blueView;
    UIView *_redView;
    UIView *_greenView;
    UILabel *_result;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    
    _grayView = [[UIView alloc] init];
    [_grayView setBackgroundColor:[UIColor grayColor]];
    [scrollView addSubview:_grayView];
    scrollView.contentSize = self.view.bounds.size;
    
    _blueView = [[UIView alloc] init];
    [_blueView setBackgroundColor:[UIColor blueColor]];
    [_grayView addSubview:_blueView];
    
    _redView = [[UIView alloc] init];
    [_redView setBackgroundColor:[UIColor redColor]];
    [_blueView addSubview:_redView];
    
    _greenView = [[UIView alloc] init];
    [_greenView setBackgroundColor:[UIColor greenColor]];
    [_redView addSubview:_greenView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [_grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(@0);
        make.height.equalTo(@280);
    }];
    
    [_blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@40);
        make.left.equalTo(@40);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    
    [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@40);
        make.center.equalTo(@0);
    }];
    
    [_greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@40);
        make.center.equalTo(@0);
    }];
    
    _result = [[UILabel alloc] init];
    [scrollView addSubview:_result];
    
    UIView *btnField = [[UIView alloc] init];
    [scrollView addSubview:btnField];
    
    [btnField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_grayView.mas_bottom).offset(20);
        make.left.right.equalTo(_grayView);
        make.height.equalTo(@190);
    }];
    
    [_result mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btnField.mas_bottom).offset(15);
        make.left.equalTo(@15);
        make.right.equalTo(@-15);
        make.bottom.equalTo(@0);
    }];
    
    NSMutableArray *btnArray = [NSMutableArray arrayWithCapacity:3];
    UIButton *btn1 = [[UIButton alloc] init];
    [btn1 setBackgroundColor:[UIColor orangeColor]];
    [btn1 setTitle:@"green frame" forState:UIControlStateNormal];
    [btnField addSubview:btn1];
    [btnArray addObject:btn1];
    btn1.tag = 10;
    [btn1 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [[UIButton alloc] init];
    [btn2 setBackgroundColor:[UIColor orangeColor]];
    [btn2 setTitle:@"blue convert green from red " forState:UIControlStateNormal];
    [btnField addSubview:btn2];
    [btnArray addObject:btn2];
    btn2.tag = 20;
    [btn2 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn3 = [[UIButton alloc] init];
    [btn3 setBackgroundColor:[UIColor orangeColor]];
    [btn3 setTitle:@"red convert green to blue" forState:UIControlStateNormal];
    [btnField addSubview:btn3];
    [btnArray addObject:btn3];
    btn3.tag = 30;
    [btn3 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn4 = [[UIButton alloc] init];
    [btn4 setBackgroundColor:[UIColor orangeColor]];
    [btn4 setTitle:@"red convert green to gray" forState:UIControlStateNormal];
    [btnField addSubview:btn4];
    [btnArray addObject:btn4];
    btn4.tag = 40;
    [btn4 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [btnArray mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:10 leadSpacing:0 tailSpacing:0];
    [btnArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.right.equalTo(@-15);
    }];
    
}

- (void)btnClicked:(UIButton *)btn {
    CGRect convertFrame;
    UIColor *color = [UIColor blackColor];
    switch (btn.tag) {
        case 10:
            convertFrame = [_greenView frame];
            color = [UIColor greenColor];
            break;
        case 20:
            convertFrame = [_blueView convertRect:_greenView.frame fromView:_redView];
            color = [UIColor blueColor];
            break;
        case 30:
            convertFrame = [_redView convertRect:_greenView.frame toView:_blueView];
            color = [UIColor redColor];
            break;
        case 40:
            convertFrame = [_redView convertRect:_greenView.frame toView:_grayView];
            color = [UIColor grayColor];
        default:
            break;
    }
    [_result setTextColor:color];
    [_result setText: NSStringFromCGRect(convertFrame)];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
