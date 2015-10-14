//
//  DHMovieHelper.m
//  LeZhi
//
//  Created by lanou3g on 15/10/8.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "DHMovieHelper.h"
#import "DHMovieModel.h"
#import "URLPicture.h"
#import "AFNetworking.h"


@interface DHMovieHelper()
@property (nonatomic,strong)NSMutableArray * allMutable;


@end

@implementation DHMovieHelper

+(DHMovieHelper *)sharedHelp{
    static DHMovieHelper * helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [DHMovieHelper new];
    });
    return helper;

}


-(void)requestWithFinsh:(void (^)())result{
//多线程
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        
//        NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:DHMovieURL]];
//        
//     //   [NSURLSession  ]
//        
//        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//             NSLog(@"=====================%@",connectionError);
//            NSLog(@"+++++++++++++++++++++++%@",data);
//            //解析
//          NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//           
//           
//            NSArray * array = [dic objectForKey:@"videoList"];
//            
//            for (NSDictionary * dict in array) {
//                
//                
//                
//                
//                DHMovieModel * item = [[DHMovieModel alloc]init];
//                [item setValuesForKeysWithDictionary:dict];
//                [self.allMutable addObject:item];
//            }
//      
//    //主线程
//            dispatch_async(dispatch_get_main_queue(), ^{
//                
//                
//                result();
//                
//            });
//            
//        }];
//        
//    });


    //=====================afn==============================
    __weak typeof(self) weakself = self;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

  //   manager.responseSerializer.acceptableContentTypes  = [NSSet setWithObject:@"text/html"];
    
    [manager GET:DHMovieURL parameters:nil success:^void(NSURLSessionDataTask * task, id results) {
//        [weakself.dataArray addObjectsFromArray:result[@"results"]];
        
       // NSLog(@"=======%@" , results);
        
        for (NSDictionary *dic in results[@"videoList"]) {
            
            DHMovieModel *model = [DHMovieModel new];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [weakself.allMutable addObject:model];
            
            
        }
       
        result();
        
    } failure:^void(NSURLSessionDataTask * task , NSError * error ) {
        
        NSLog(@"%@", error);
        
    }];

    
    //=====================afn==============================

    
    
    
    
    
    
    



}

-(NSMutableArray *)allMutable{
    if (_allMutable == nil) {
        _allMutable = [NSMutableArray array ];
    }
    return _allMutable;

}
-(DHMovieModel *)itemWithIndex:(NSInteger)index{


    return self.allMutable[index];


}

-(NSArray *)allMovie{

    return [_allMutable mutableCopy];


}
@end
