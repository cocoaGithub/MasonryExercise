//
//  MyTabViewController.m
//  MasonryProject
//
//  Created by cocoa on 16/10/20.
//  Copyright © 2016年 cocoa. All rights reserved.
//

#import "MyTabViewController.h"
#import "ViewController.h"

@interface MyTabViewController ()

@end

@implementation MyTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ViewController *first = [[ViewController alloc] init];
    first.tabBarItem.title = @"Home";
    [first.tabBarItem setImage:[UIImage imageNamed:@"first"]];
    [first.tabBarItem setSelectedImage:[UIImage imageNamed:@"first_sel"]];
    
    ViewController *second = [[ViewController alloc] init];
    second.tabBarItem.title = @"Cart";
    [second.tabBarItem setImage:[UIImage imageNamed:@"second"]];
    [second.tabBarItem setSelectedImage:[UIImage imageNamed:@"second_sel"]];
    
    ViewController *third = [[ViewController alloc] init];
    third.tabBarItem.title = @"home";
    [third.tabBarItem setImage:[UIImage imageNamed:@"SelfInfo"]];
    [third.tabBarItem setSelectedImage:[UIImage imageNamed:@"third_sel"]];
    
    [self addChildViewController:first];
    [self addChildViewController:second];
    [self addChildViewController:third];
    
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
