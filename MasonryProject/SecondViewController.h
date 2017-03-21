//
//  SecondViewController.h
//  MasonryProject
//
//  Created by cocoa on 16/10/20.
//  Copyright © 2016年 cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DataTranserDelegate <NSObject>
- (void) showData:(NSString*) data;
@end

@interface SecondViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak,nonatomic) id<DataTranserDelegate> delegate;

@end
