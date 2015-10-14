//
//  DBGirlListHelper.h
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/13.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBGirlListHelper : NSObject
//单例
+ (DBGirlListHelper *)shanreGirlListHelper;

//请求数据
- (void)requestWithGirlListCellofPage:(NSUInteger)page Finsh:(void(^)())result;

//根据一个index 返回一个model
- (DBGirlListHelper *)itemWithIndex:(NSInteger)index;

//存储model数组
@property (nonatomic,strong) NSArray *allGirimg;
@end
