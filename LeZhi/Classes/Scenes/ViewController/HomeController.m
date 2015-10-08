//
//  HomeController.m
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/7.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "HomeController.h"
#import "HeadlineController.h"
#import "MovieController.h"
#import "MineController.h"
#define kNavigationColor [UIColor colorWithRed:229/255.0 green:63/255.0 blue:34/255.0 alpha:1]



@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    HeadlineController *headVC = [[HeadlineController alloc]init];
    UINavigationController *headNC  = [[UINavigationController alloc]initWithRootViewController:headVC];
    
    headNC.navigationBar.translucent = NO;
    UIImage *presentImage = [UIImage imageNamed:@"xinwen.png"];
    UIImage *presemtimage1 = [UIImage imageNamed:@"xinwen1.png"];
    presemtimage1 = [presemtimage1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    headNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"推荐" image:presentImage selectedImage:presemtimage1];
    
    //firstPresentNC.navigationBar.barTintColor = kNavigationColor;
    
    MovieController *moveVC = [[MovieController alloc]init];
    UINavigationController *moveNC = [[UINavigationController alloc]initWithRootViewController:moveVC];
    moveNC.navigationBar.translucent = NO;
    UIImage *singleImg = [UIImage imageNamed:@"shipin.png"];
    UIImage *singleImg1 = [UIImage imageNamed:@"shipin1.png"];
    singleImg1 = [singleImg1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    moveNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"视频" image:singleImg selectedImage:singleImg1];
    
    //singleNC.navigationBar.barTintColor = kNavigationColor;
    
    MineController *mineVC = [[MineController alloc]init];
    UINavigationController *mineNC = [[UINavigationController alloc]initWithRootViewController:mineVC];
    mineNC.navigationBar.translucent = NO;
    UIImage * single = [UIImage imageNamed:@"wo.png"];
    UIImage * single1 = [UIImage imageNamed:@"wo1.png"];
    singleImg1 = [singleImg1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mineNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:single1 selectedImage:single];
    NSArray *tabBarArray = @[headNC , moveNC , mineNC];
    
    
    self.tabBar.translucent = NO;
    
    self.viewControllers = tabBarArray;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
