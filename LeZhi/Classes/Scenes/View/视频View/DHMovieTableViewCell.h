//
//  DHMovieTableViewCell.h
//  LeZhi
//
//  Created by lanou3g on 15/10/8.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHMovieModel.h"
@interface DHMovieTableViewCell : UITableViewCell
@property (nonatomic ,strong)DHMovieModel * MovieModel;

@property (nonatomic,strong) UILabel * lab4Title;
@property (nonatomic,strong) UILabel * lab4Description;
@property (nonatomic,strong) UIImageView * img4URL;






@end
