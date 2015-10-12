//
//  TouTiaoTableViewCell.h
//  LeZhi
//
//  Created by lanou3g on 15/10/7.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OneImageCellModel.h"

@interface TouTiaoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *img4OneImgCell;

@property (weak, nonatomic) IBOutlet UILabel *title4OneImgCell;

@property (weak, nonatomic) IBOutlet UILabel *time4OneImgCell;

@property (weak, nonatomic) IBOutlet UILabel *pinlun4OneImgCell;


@property (nonatomic , strong) OneImageCellModel *oneImeCellModel;


@end
