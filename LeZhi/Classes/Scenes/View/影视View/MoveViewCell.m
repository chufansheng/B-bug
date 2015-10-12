//
//  MoveViewCell.m
//  LeZhi
//
//  Created by lanou3g on 15/10/8.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "MoveViewCell.h"
#import "UIImageView+WebCache.h"
#import "MoveCellMode.h"
@implementation MoveViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(MoveCellMode *)model{
    [self.img4Pic sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    
    self.lab.text = model.title;
    self.lab.font = [UIFont systemFontOfSize:14];
    
    self.lab1.text = model.digest;
    self.lab1.font = [UIFont systemFontOfSize:12];
}
@end
