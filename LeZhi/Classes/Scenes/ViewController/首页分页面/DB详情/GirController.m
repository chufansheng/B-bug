//
//  GirController.m
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/14.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "GirController.h"
#import "DBGirlModel.h"
#import "UIImageView+WebCache.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface GirController ()
@property (nonatomic,strong) UIImageView *Girlimg;
@end

@implementation GirController

                       

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Girlimg.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 55);
    [_Girlimg sd_setImageWithURL:[NSURL URLWithString:self.girlModel.thumbnail]];
    [self.view addSubview:self.Girlimg];

}

- (UIImageView *)Girlimg{
    if (!_Girlimg) {
        _Girlimg = [UIImageView new];
    }
    return _Girlimg;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
