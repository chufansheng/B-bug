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

+ (TouTiaoHelper *)shanreTouTiaoHelper{
    static TouTiaoHelper *helper = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        helper = [TouTiaoHelper new];
    });
    return helper;
}


- (void)requestWithTouTiaoListCellofPage:(NSUInteger)page Finsh:(void (^)())result{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        NSString *url = kTouTiaoUrl(page);
        
        if (page == 1) {
            [self.mtuTouTiaoArr removeAllObjects];
        }
        
        [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *  operation, id responseObject) {
            
            for (NSDictionary *dic in responseObject[1][@"item"]) {
                OneImageCellModel *model = [OneImageCellModel new];
                
                [model setValuesForKeysWithDictionary:dic];
                
                [self.mtuTouTiaoArr addObject:model];
            }
            
            for (NSDictionary *dict in responseObject[0][@"item"]) {
                
                OneImageCellModel *model = [OneImageCellModel new];
                
                [model setValuesForKeysWithDictionary:dict];
                
                [self.mtuTouTiaoHeaderArr addObject:model];
                
            }
            
            result();
            
        } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError *  error) {
            NSLog(@"失败");
        }];
        
        
    });
    
    
}



@end
