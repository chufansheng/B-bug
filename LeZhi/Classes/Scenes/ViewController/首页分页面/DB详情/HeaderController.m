//
//  HeaderController.m
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/12.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "HeaderController.h"

@interface HeaderController ()<UIWebViewDelegate>

@end

@implementation HeaderController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _web4Veiw4 = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 110)];
        NSURLRequest *ui = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
        self.web4Veiw4.scalesPageToFit = YES;
        [self.web4Veiw4  loadRequest:ui];
        [self.view addSubview:self.web4Veiw4];
        self.web4Veiw4.delegate = self;
        [self loadHud];
    }
-(void)webViewDidFinishLoad:(UIWebView *)webView{
       [self.HUD hide:YES];
}
#pragma mark --- 加载进度提示框 ----
- (void)loadHud{
    
    self.HUD = [[MBProgressHUD alloc]initWithView:self.view];
    
    [self.view addSubview:self.HUD];
    
    
    self.HUD.dimBackground = YES;
    
    self.HUD.labelText = @"正在加载...";
    
    [self.HUD showAnimated:YES whileExecutingBlock:^{
        sleep(3);
    } completionBlock:^{
        [self.HUD removeFromSuperview];
        self.HUD = nil;
    }];
    
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
