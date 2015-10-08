//
//  OneImageCellModel.h
//  LeZhi
//
//  Created by lanou3g on 15/10/7.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OneImageCellModel : NSObject

@property (nonatomic , copy) NSString *commentsall;//评论数

@property (nonatomic , copy) NSURL *commentsUrl;//详情webView

@property (nonatomic , copy) NSString *online;

@property (nonatomic , copy) NSString *source;//接口类型

@property (nonatomic , copy) NSString *type;//cell类型

@property (nonatomic , copy) NSString *updateTime;//发帖时间


@property (nonatomic , copy) NSString *title;//单图cell标题

@property (nonatomic , copy) NSString *thumbnail;//单图cell图片

@property (nonatomic , copy) NSString *OneID;//单图cell详情

@property (nonatomic , retain) NSMutableArray *images;//多图cellt图片数组

@property (nonatomic , retain) NSMutableDictionary *style;//多图cell字典
@end
