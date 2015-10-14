//
//  DBGirlListHelper.m
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/13.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "DBGirlListHelper.h"
#import "AFNetworking.h"
#import "URLPicture.h"
#import "DBGirlModel.h"

@interface DBGirlListHelper()
@property (nonatomic,strong) NSMutableArray *allGirlMutabel;
@end

@implementation DBGirlListHelper
//单例
+ (DBGirlListHelper *)shanreGirlListHelper
{
    static DBGirlListHelper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [DBGirlListHelper new];
    });
    return helper;
}
//请求数据
- (void)requestWithGirlListCellofPage:(NSUInteger)page Finsh:(void(^)())results
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:kGirlURL(page) parameters:nil success:^(NSURLSessionDataTask * task, id result)
    {
        if (page == 0)
        {
            [self.allGirlMutabel removeAllObjects];
        }
      
        for (NSDictionary *girlDic in  result[@"body"])
        {
            DBGirlModel * model = [DBGirlModel new];
            [model setValuesForKeysWithDictionary:girlDic];
            [self.allGirlMutabel addObject:model];
            
        }
//        for (NSDictionary *girlXiangDic in result[@"meta"]) {
//            DBGirlModel * model = [DBGirlModel new];
//            [model setValuesForKeysWithDictionary:girlXiangDic];
//            [self.allGirlMutabel addObject:model];
//        }        
//        NSString *idStr = result[@"meta"][@"id"];
//        [self.allGirlMutabel addObject:idStr];
        
        results();
        
    } failure:^(NSURLSessionDataTask * task, NSError * error)
    {
        NSLog(@"%@",error);
    }];
}

//根据一个index 返回一个model
- (DBGirlModel *)itemWithIndex:(NSInteger)index
{
    return self.allGirlMutabel[index];
}
#pragma mark --lanjiazai--
- (NSMutableArray *)allGirlMutabel
{
    if (!_allGirlMutabel)
    {
        _allGirlMutabel = [NSMutableArray array];
    }
    return _allGirlMutabel;
}
//返回不可变数组
- (NSArray *)allGirimg
{
    return [_allGirlMutabel mutableCopy];
}

@end
