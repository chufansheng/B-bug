//
//  MoveXiangController.h
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/12.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import <UIKit/UIKit.h>
//进度提示框
#import "MBProgressHUD.h"

@class MoveCellMode;
@interface MoveXiangController : UIViewController
@property (nonatomic,strong) UIWebView *web4Veiw;
@property (nonatomic,strong) MoveCellMode *modelWeb;
@property (nonatomic,strong) MBProgressHUD *HUD;

@end
