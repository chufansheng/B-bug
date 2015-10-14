//
//  TouTiaoHelper.h
//  LeZhi
//
//  Created by lanou3g on 15/10/7.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TouTiaoHelper : NSObject

//+ (TouTiaoHelper *)shanreTouTiaoHelper;

//- (void)requestWithTouTiaoListCellofPage:(NSUInteger)page Finsh:(void (^)(NSMutableArray *array))result;

- (void)requestWithHeaderImgUrl:(NSString *)url Finsh:(void (^)(NSMutableArray *array))result;

- (void)requestWithListCellofUrl:(NSString *)url Finsh:(void (^)(NSMutableArray *array))result;


@end
