//
//  MoveFenViewCell.m
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/10.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "MoveFenViewCell.h"
#import "UIImageView+WebCache.h"
#import "MoveCellMode.h"

@implementation MoveFenViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel1:(MoveCellMode *)model1{


    [self.fenImg1 sd_setImageWithURL:[NSURL URLWithString:model1.imgsrc]];
    
    [self.fenImg2 sd_setImageWithURL:[NSURL URLWithString:model1.imgextra[0][@"imgsrc"]]];
    [self.fenImg3 sd_setImageWithURL:[NSURL URLWithString:model1.imgextra[1][@"imgsrc"]]];

    self.labTitle.text = model1.title;



}

@end
