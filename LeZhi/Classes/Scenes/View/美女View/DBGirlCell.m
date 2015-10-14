//
//  DBGirlCell.m
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/13.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "DBGirlCell.h"
#import "UIImageView+WebCache.h"
#import "DBGirlModel.h"

@implementation DBGirlCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(DBGirlModel *)model{
    [self.imgGirl sd_setImageWithURL:[NSURL URLWithString: model.thumbnail]];
    
    self.labZan.text = [NSString stringWithFormat:@"%ld",model.likes];
    self.labPing.text = [NSString stringWithFormat:@"%ld",model.comments];
    
}
@end
