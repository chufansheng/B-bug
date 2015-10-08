//
//  DHMovieModel.m
//  LeZhi
//
//  Created by lanou3g on 15/10/8.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "DHMovieModel.h"

@implementation DHMovieModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

    if ([key isEqualToString:@"description"]) {
        _movieDescription = value;
    }

}



@end
