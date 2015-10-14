//
//  DBGirlCell.h
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/13.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DBGirlModel;
@interface DBGirlCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgGirl;
@property (weak, nonatomic) IBOutlet UILabel *labZan;
@property (weak, nonatomic) IBOutlet UILabel *labPing;
@property (nonatomic,strong) DBGirlModel *model;
@end
