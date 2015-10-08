//
//  DHMovieModel.h
//  LeZhi
//
//  Created by lanou3g on 15/10/8.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHMovieModel : NSObject
//图片url
@property (nonatomic ,strong) NSString * cover ;
//标题
@property (nonatomic,strong)NSString * title;
//视频内容描述
@property (nonatomic,strong)NSString * movieDescription;
//视频url
@property (nonatomic,strong)NSString * mp4_url;





@end
