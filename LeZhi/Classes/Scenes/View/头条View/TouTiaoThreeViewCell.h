//
//  TouTiaoThreeViewCell.h
//  LeZhi
//
//  Created by lanou3g on 15/10/12.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OneImageCellModel.h"

@interface TouTiaoThreeViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title4ThreeImgCell;

@property (weak, nonatomic) IBOutlet UIImageView *left4ThreeImgCell;

@property (weak, nonatomic) IBOutlet UIImageView *center4ThreeImgCell;

@property (weak, nonatomic) IBOutlet UIImageView *right4ThreeImgCell;

@property (weak, nonatomic) IBOutlet UILabel *time4ThreeImgCell;

@property (weak, nonatomic) IBOutlet UILabel *pinlun4ThreeImgCell;

@property (nonatomic , strong) OneImageCellModel *model;

@end
