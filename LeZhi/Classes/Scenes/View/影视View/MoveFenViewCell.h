//
//  MoveFenViewCell.h
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/10.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MoveCellMode;
@interface MoveFenViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *fenImg1;
@property (weak, nonatomic) IBOutlet UIImageView *fenImg2;
@property (weak, nonatomic) IBOutlet UIImageView *fenImg3;
@property (weak, nonatomic) IBOutlet UILabel *labTitle;
@property (nonatomic,strong) MoveCellMode *model1;

@end
