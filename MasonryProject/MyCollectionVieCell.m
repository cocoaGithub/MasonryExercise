//
//  MyCollectionVieCell.m
//  MasonryProject
//
//  Created by cocoa on 16/10/21.
//  Copyright © 2016年 cocoa. All rights reserved.
//

#import "MyCollectionVieCell.h"


@implementation MyCollectionVieCell

- (id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _topImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0,70, 70)];
        _topImage.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_topImage];
        
        _botLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 70, 30)];
        _botLab.textAlignment = NSTextAlignmentCenter;
        _botLab.textColor = [UIColor yellowColor];
        [self.contentView addSubview:_botLab];
        
    }
    return self;
}

@end
