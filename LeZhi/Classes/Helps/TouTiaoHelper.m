//
//  TouTiaoHelper.m
//  LeZhi
//
//  Created by lanou3g on 15/10/7.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "TouTiaoHelper.h"

#import "AFNetworking.h"

#import "OneImageCellModel.h"

#import "URLPicture.h"

@interface TouTiaoHelper ()

@property (nonatomic , strong)NSMutableArray *mtuTouTiaoArr;//头条列表数组

@property (nonatomic , strong)NSMutableArray *mtuTouTiaoHeaderArr;//轮播图

@end


@implementation TouTiaoHelper

//+ (TouTiaoHelper *)shanreTouTiaoHelper{
//    static TouTiaoHelper *helper = nil;
//    static dispatch_once_t oneToken;
//    dispatch_once(&oneToken, ^{
//        helper = [TouTiaoHelper new];
//    });
//    return helper;
//}


//- (void)requestWithTouTiaoListCellofPage:(NSUInteger)page Finsh:(void (^)(NSMutableArray *array))result{
//    
//
//        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//        
//       // manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//        
//        [manager GET:kTouTiaoUrl(page) parameters:nil success:^(NSURLSessionDataTask *  task, id  responseObject) {
//            
//            
//            
//            for (NSDictionary *dic in responseObject[0][@"item"]) {
//                OneImageCellModel *model = [OneImageCellModel new];
//                
//                [model setValuesForKeysWithDictionary:dic];
//                
//                [self.mtuTouTiaoArr addObject:model];
//            }
//            
//            result(self.mtuTouTiaoArr);
//            
//        } failure:^(NSURLSessionDataTask *  task, NSError * error) {
//           
//             NSLog(@"失败%@",error);
//        }];
//    
//}

//===============================================================

- (void)requestWithListCellofUrl:(NSString *)url Finsh:(void (^)(NSMutableArray *array))result{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask *  task, id  responseObject) {
        
        for (NSDictionary *dic in responseObject[0][@"item"]) {
            OneImageCellModel *model = [OneImageCellModel new];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.mtuTouTiaoArr addObject:model];
        }
        
        result(self.mtuTouTiaoArr);
        
    } failure:^(NSURLSessionDataTask *  task, NSError * error) {
        
        NSLog(@"失败%@",error);
    }];
    
    
}


//===============================================================


- (NSMutableArray *)mtuTouTiaoArr{
    
    if (_mtuTouTiaoArr == nil) {
        _mtuTouTiaoArr = [NSMutableArray array];
    }
    return _mtuTouTiaoArr;
}

//- (void)requestWithTouTiaoHeaderImgFinsh:(void (^)(NSMutableArray *))result{
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    
//    [manager GET:kTouTiaoHeaderImgUrl parameters:nil success:^(NSURLSessionDataTask *  task, id  responseObject) {
//        
//        
//        
//        for (NSDictionary *dict in responseObject[1][@"item"]) {
//            
//            OneImageCellModel *model = [OneImageCellModel new];
//            
//            [model setValuesForKeysWithDictionary:dict];
//            
//            [self.mtuTouTiaoHeaderArr addObject:model];
//            
//        }
//        
//        result(self.mtuTouTiaoHeaderArr);
//        
//    } failure:^(NSURLSessionDataTask *  task, NSError * error) {
//        
//        NSLog(@"失败%@",error);
//    }];
//}

- (void)requestWithHeaderImgUrl:(NSString *)url Finsh:(void (^)(NSMutableArray *))result{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
        [manager GET:url parameters:nil success:^(NSURLSessionDataTask *  task, id  responseObject) {

        for (NSDictionary *dict in responseObject[1][@"item"]) {
            
            OneImageCellModel *model = [OneImageCellModel new];
    
            [model setValuesForKeysWithDictionary:dict];
            
            [self.mtuTouTiaoHeaderArr addObject:model];
    
    }

        result(self.mtuTouTiaoHeaderArr);
            
    } failure:^(NSURLSessionDataTask *  task, NSError * error) {
        
           NSLog(@"失败%@",error);
    }];

    
}


- (NSMutableArray *)mtuTouTiaoHeaderArr{
    
    if (_mtuTouTiaoHeaderArr == nil) {
        _mtuTouTiaoHeaderArr = [NSMutableArray array];
    }
    
    return _mtuTouTiaoHeaderArr;
}


@end
