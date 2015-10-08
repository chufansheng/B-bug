//
//  DHMovieTableViewCell.m
//  LeZhi
//
//  Created by lanou3g on 15/10/8.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "DHMovieTableViewCell.h"

@implementation DHMovieTableViewCell

- (void)awakeFromNib {
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
    

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self drawView];
    }
    
    
    return self;



}

-(void)drawView{
    
    self.lab4Title = [[UILabel alloc]init];
    self.lab4Title.numberOfLines=0;
    self.lab4Title.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview: self.lab4Title];
    
    self.img4URL = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 120, 150)];
    [self.contentView addSubview:self.img4URL];
    self.lab4Description = [[UILabel alloc]initWithFrame:CGRectMake(140, 130, 200, 30)];
    [self.contentView addSubview:self.lab4Description];
    
    
 
    
    
}

-(void)setMovieModel:(DHMovieModel *)MovieModel{

    self.lab4Title.text = MovieModel.title;
    self.lab4Description.text = MovieModel.movieDescription;



}








@end
