//
//  ViewController.m
//  MasonryProject
//
//  Created by cocoa on 16/10/20.
//  Copyright © 2016年 cocoa. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "SecondViewController.h"

@interface ViewController ()<DataTranserDelegate>
@property (strong,nonatomic) UITextField * nameText;
@property (strong,nonatomic) UITextField * numberText;
@property(strong,nonatomic) UILabel *showLab;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *rootView = self.view;
    
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *imageview = [[UIImageView alloc] init];
    [imageview setImage:[UIImage imageNamed:@"test_image"]];
    [rootView addSubview:imageview];
    
    UILabel *nameLab = [[UILabel alloc] init];
    [nameLab setText:@"name:"];
    [nameLab setTextAlignment:NSTextAlignmentRight];
    [rootView addSubview:nameLab];
    
    UILabel *numberLab = [[UILabel alloc] init];
    [numberLab setText:@"number:"];
    [numberLab setTextAlignment:NSTextAlignmentRight];
    [rootView addSubview:numberLab];
    
    UITextField *nameText = [[UITextField alloc] init];
    [nameText setPlaceholder:@"name"];
    [nameText setBorderStyle:UITextBorderStyleRoundedRect];
    [nameText setKeyboardType:UIKeyboardTypeDefault];
    [nameText setKeyboardAppearance:UIKeyboardAppearanceLight];
    [nameText addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [rootView addSubview:nameText];
    
    UITextField *numberText = [[UITextField alloc] init];
    [numberText setPlaceholder:@"input a number"];
    [numberText setBorderStyle:UITextBorderStyleRoundedRect];
    [numberText setKeyboardType:UIKeyboardTypeNumberPad];
    [numberText addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [rootView addSubview:numberText];
    
    UIButton *signBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [signBtn setTitle:@"Sign In" forState:UIControlStateNormal];
    [signBtn setBackgroundColor:[UIColor greenColor]];
    [signBtn addTarget:self action:@selector(signBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [rootView addSubview:signBtn];
    
    UIButton *transferBtn = [[UIButton alloc] init];
    [transferBtn setTitle:@"Next page" forState:UIControlStateNormal];
    [transferBtn setBackgroundColor:[UIColor blueColor]];
    [transferBtn addTarget:self action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
    [rootView addSubview:transferBtn];
    
    _showLab = [[UILabel alloc] init];
    [_showLab setBackgroundColor:[UIColor redColor]];
    [rootView addSubview:_showLab];
    
    [imageview mas_makeConstraints:^(MASConstraintMaker* make){
        //make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300,100));
        make.centerX.equalTo(rootView.mas_centerX);
        make.top.equalTo(rootView).with.offset(64);
    }];
    
    [nameLab mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.equalTo(rootView.mas_left).with.offset(40);
        make.top.equalTo(imageview.mas_bottom).with.offset(30);
        make.size.mas_equalTo(CGSizeMake(70, 24));
    }];
    
    [numberLab mas_makeConstraints:^(MASConstraintMaker* make){
       
        make.left.equalTo(nameLab);
        make.top.equalTo(nameLab.mas_bottom).with.offset(5);
        make.size.equalTo(nameLab);
    }];
    
    [nameText mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(nameLab);
        make.left.equalTo(nameLab.mas_right).with.offset(5);
        make.bottom.equalTo(nameLab);
        make.right.equalTo(rootView).with.offset(-40);
    }];
    
    [numberText mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(nameText);
        make.top.equalTo(numberLab);
        make.size.equalTo(nameText);
    }];
    
    [signBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(numberText.mas_bottom).with.offset(30);
        make.centerX.equalTo(rootView);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
    [transferBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(rootView).with.offset(-60);
        make.right.equalTo(rootView).with.offset(-20);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    [_showLab mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(signBtn).with.offset(100);
        make.centerX.equalTo(rootView);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    
}

- (void) showData:(NSString*) data{
    [_showLab setText:data];
}
- (void)nextPage:(id) sender{
    
    SecondViewController * secondViewController = [[SecondViewController alloc] init];
    secondViewController.delegate = self;
    [self.navigationController pushViewController:secondViewController animated:YES];

}

//- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
//        backItem.title = @"Show";
//        self.navigationItem.backBarButtonItem = backItem;
//    }
//    return self;
//}

- (void) textFieldDoneEditing:(UITextField*) sender{
    [sender resignFirstResponder];
}


- (void) signBtnPressed:(UIButton *)sender{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Are you sure?" message:@"you will sign in" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:yesAction];
    [alert addAction:noAction];
    
    
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
