//
//  MoveCell.h
//  LeZhi
//
//  Created by lanou3g on 15/10/8.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoveCellMode : NSObject
@property (nonatomic , copy) NSString *digest;//副标题

@property (nonatomic , copy) NSString *title;//cell标题

@property (nonatomic , copy) NSString *url_3w;//详情页webView网址

@property (nonatomic , strong) NSString *imgsrc;//cell图片

@property (nonatomic,strong) NSMutableArray *imgextra;//分栏图片

@end
