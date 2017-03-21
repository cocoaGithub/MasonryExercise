//
//  SecondViewController.m
//  MasonryProject
//
//  Created by cocoa on 16/10/20.
//  Copyright © 2016年 cocoa. All rights reserved.
//

#import "SecondViewController.h"
#import "Masonry.h"
#import "ThirdViewController.h"
#import "TestViewController.h"



@interface SecondViewController ()

@property(strong,nonatomic) UITextField *data;
@property(strong,nonatomic) UITableView *table;
@property(strong,nonatomic) NSMutableArray *dataArray1;
@property(strong,nonatomic) NSMutableArray *dataArray2;
@property(strong,nonatomic) NSMutableArray *dataArray3;
@property(strong,nonatomic) NSMutableArray *titleArray;
@property(strong,nonatomic) NSMutableArray* dataArray;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _table = [[UITableView alloc] init];
    [_table setDelegate:self];
    [_table setDataSource:self];
    [self.view addSubview:_table];
    
    _data = [[UITextField alloc] init];
    [_data setBorderStyle:UITextBorderStyleRoundedRect];
    [_data addTarget:self action:@selector(dataReady:) forControlEvents:UIControlEventEditingDidEnd];
    [self.view addSubview:_data];
   
    
    [_data mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(100);
        make.size.mas_equalTo(CGSizeMake(200, 30));
    }];
    
    
    [_table mas_makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(_data).with.offset(20);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    _dataArray1 = [[NSMutableArray alloc] initWithObjects:@"China",@"Americal",@"Japan", nil];
    _dataArray2 = [[NSMutableArray alloc] initWithObjects:@"黄种人", @"黑种人", nil];
    _dataArray3 = [[NSMutableArray alloc] initWithObjects:@"left", @"right",@"top",@"bottom" ,nil];
    _titleArray = [[NSMutableArray alloc] initWithObjects:@"国家", @"种族",@"derection", nil];
    _dataArray = [[NSMutableArray alloc] initWithObjects:_dataArray1,_dataArray2,_dataArray3, nil];

}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    switch (section) {
//        case 0:
//        case 1:
//        case 2:
//            return [_titleArray objectAtIndex:section];
//            
//        default:
//            return @"Unkonown";
//    }
//}

- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    
    [view setBackgroundColor:[UIColor brownColor]];//改变标题的颜色，也可用图片
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 100, 30)];
    
    label.textColor = [UIColor redColor];
    
    label.backgroundColor = [UIColor clearColor];
    
    label.text = [_titleArray objectAtIndex:section];
    [view addSubview:label];
    return view;

}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_titleArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    switch (section) {
//        case 0:
//            return [_dataArray1 count];
//        case 1:
//            return [_dataArray2 count];
//        case 2:
//            return [_dataArray3 count];
//        default:
//            return 0;
//    }
    
    return [[_dataArray objectAtIndex:section] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellDentifier = @"Cell";
    UITableViewCell *cell = (UITableViewCell*) [tableView dequeueReusableCellWithIdentifier:cellDentifier];
    if (cell == nil) {
        //cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:cellDentifier];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellDentifier];
    }
    
//    switch (indexPath.section) {
//        case 0:
//            [[cell textLabel] setText:[_dataArray1 objectAtIndex:indexPath.row]];
//            break;
//        case 1:
//            [[cell textLabel] setText:[_dataArray2 objectAtIndex:indexPath.row]];
//            break;
//        case 2:
//            [[cell textLabel] setText:[_dataArray3 objectAtIndex:indexPath.row]];
//            break;
//
//            
//        default:
//            [[cell textLabel] setText:@"Unknown"];
//            break;
//    }
    [[cell textLabel] setText:[[_dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    [[cell imageView] setImage:[UIImage imageNamed:@"test_image"]];
    [[cell detailTextLabel] setText:@"detail..."];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
//    UIButton *indicator = [[UIButton alloc] init];
//    [indicator setBackgroundColor:[UIColor redColor]];
//    [cell setAccessoryView:indicator];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *info = [[_dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
//    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@" you selected :" message:info delegate:self cancelButtonTitle:@"sure" otherButtonTitles:@"cancel", nil];
//    [alert show];
//    UINavigationController * nav =[[UINavigationController alloc] initWithRootViewController:self];
    
    //ThirdViewController *thirdView = [[ThirdViewController alloc] init];
    TestViewController *testview = [[TestViewController alloc] init];
    [self.navigationController pushViewController:testview animated:YES];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    
}



- (void) dataReady:(UITextField*) sender{
    [_delegate showData:_data.text];
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
