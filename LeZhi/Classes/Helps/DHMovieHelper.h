//
//  DHMovieHelper.h
//  LeZhi
//
//  Created by lanou3g on 15/10/8.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DHMovieModel;
@interface DHMovieHelper : NSObject




+(DHMovieHelper*)sharedHelp;

-(void)requestWithFinsh:(void(^)())result;

//cell中用
@property (nonatomic,strong)NSArray * allMovie;

-(DHMovieModel*)itemWithIndex:(NSInteger)index;



@end
