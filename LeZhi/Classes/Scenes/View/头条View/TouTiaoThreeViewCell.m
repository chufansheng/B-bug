//
//  TouTiaoThreeViewCell.m
//  LeZhi
//
//  Created by lanou3g on 15/10/12.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "TouTiaoThreeViewCell.h"

#import "UIImageView+WebCache.h"

@implementation TouTiaoThreeViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(OneImageCellModel *)model{
    
    self.title4ThreeImgCell.text = model.title;
    
    self.time4ThreeImgCell.text = [model.updateTime substringWithRange:NSMakeRange(11, 5)];
    
    self.pinlun4ThreeImgCell.text = model.commentsall;
    
    NSMutableArray *picArray = [NSMutableArray array];
    for (int i = 0 ; i < 3; i++) {
        [ picArray addObject:model.style[@"images"][i] ] ;
        
    }
    [self.left4ThreeImgCell sd_setImageWithURL:[NSURL URLWithString:picArray[0]] placeholderImage:[UIImage imageNamed:@"zhanwei.png"]];
    [self.center4ThreeImgCell sd_setImageWithURL:[NSURL URLWithString:picArray[1]] placeholderImage:[UIImage imageNamed:@"zhanwei.png"]];
    [self.right4ThreeImgCell sd_setImageWithURL:[NSURL URLWithString:picArray[2]] placeholderImage:[UIImage imageNamed:@"zhanwei.png"]];
    
    
}

@end
