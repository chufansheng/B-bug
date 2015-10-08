//
//  MoveLIst.m
//  LeZhi
//
//  Created by lanou3g on 15/10/8.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "MoveLIstHelper.h"
#import "AFNetworking.h"
#import "URLPicture.h"
#import "MoveCellMode.h"
@interface MoveLIst ()
@property (nonatomic,strong)NSMutableArray *allMoveMutable;

@end



@implementation MoveLIst
+ (MoveLIst *)sharedHelp{
    static MoveLIst *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [MoveLIst new];
    });
    return helper;
}
//请求数据
//- (void)requestAllMoveWithFinish:(void (^)())results
//{
//
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    
//    //NSLog(@"--111");
//
//    [manager GET:URLMove parameters:nil success:^(NSURLSessionDataTask *tadk, id result){
//        //NSLog(@"%@",result);
//       NSArray *allMove = [result objectForKey:@"T1348648650048"];
//        for(NSDictionary *dic in allMove){
//            MoveCellMode *move = [MoveCellMode new];
//            [move setValuesForKeysWithDictionary:dic];
//            [self.allMoveMutable addObject:move];
//            
//        }
//        //NSLog(@"%@",_allMoveMutable);
//        results();
//    }failure:^(NSURLSessionDataTask *task, NSError *error){
//        NSLog(@"失败");
//    }];
//}


- (void)requestWithMoveListCellofPage:(NSUInteger)page Finsh:(void(^)())results{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    //NSLog(@"--111");
    
    [manager GET:kYingshiUrl(page) parameters:nil success:^(NSURLSessionDataTask *tadk, id result){
        //NSLog(@"%@",result);
        
        if (page == 0) {
            [self.allMoveMutable removeAllObjects];
        }
        
        NSArray *allMove = [result objectForKey:@"T1348648650048"];
        for(NSDictionary *dic in allMove){
            MoveCellMode *move = [MoveCellMode new];
            [move setValuesForKeysWithDictionary:dic];
            [self.allMoveMutable addObject:move];
            
        }
        //NSLog(@"%@",_allMoveMutable);
        results();
    }failure:^(NSURLSessionDataTask *task, NSError *error){
        NSLog(@"失败");
    }];

}






//根据一个index 返回一个model
- (MoveCellMode *)itemWithIndex:(NSInteger)index{
    return self.allMoveMutable[index];
}
//懒加载
- (NSMutableArray *)allMoveMutable{
    if (_allMoveMutable == nil) {
        _allMoveMutable = [NSMutableArray array];
        
    }
    return _allMoveMutable;
}

//返回不可变数组
- (NSArray *)allMove{


    return [_allMoveMutable mutableCopy];
}

@end
