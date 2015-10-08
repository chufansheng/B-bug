//
//  MoveViewCell.h
//  LeZhi
//
//  Created by lanou3g on 15/10/8.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MoveCellMode;
@interface MoveViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img4Pic;

@property (weak, nonatomic) IBOutlet UILabel *lab;
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (nonatomic,strong) MoveCellMode *model;
@end
