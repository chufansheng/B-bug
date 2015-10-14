//
//  TouTiaoTableViewCell.m
//  LeZhi
//
//  Created by lanou3g on 15/10/7.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "TouTiaoTableViewCell.h"

#import "UIImageView+WebCache.h"

@implementation TouTiaoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setOneImeCellModel:(OneImageCellModel *)oneImeCellModel{
    
    [_img4OneImgCell sd_setImageWithURL:[NSURL URLWithString:oneImeCellModel.thumbnail]];
    
    _title4OneImgCell.text = oneImeCellModel.title;
    
    _time4OneImgCell.text = oneImeCellModel.updateTime;
    
    _pinlun4OneImgCell.text = oneImeCellModel.commentsall;
    
}



@end
