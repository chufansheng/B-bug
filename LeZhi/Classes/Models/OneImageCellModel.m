//
//  OneImageCellModel.m
//  LeZhi
//
//  Created by lanou3g on 15/10/7.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "OneImageCellModel.h"

@implementation OneImageCellModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"id"]) {
        _OneID = value;
    }
    
}



@end
