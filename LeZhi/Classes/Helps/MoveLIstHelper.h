//
//  MoveLIst.h
//  LeZhi
//
//  Created by lanou3g on 15/10/8.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MoveCellMode.h"
@interface MoveLIst : NSObject
@property (nonatomic,strong) NSArray *allMove;

@property (nonatomic,strong) NSMutableArray *bigImg;
@property (nonatomic,strong) NSMutableArray *fenImg;

+ (MoveLIst *)sharedHelp;
//请求数据
//- (void)requestAllMoveWithFinish:(void (^)())results;
- (void)requestWithMoveListCellofPage:(NSUInteger)page Finsh:(void(^)())results;

//根据一个index 返回一个model
- (MoveCellMode *)itemWithIndex:(NSInteger)index;
@end
