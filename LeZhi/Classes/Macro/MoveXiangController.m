//
//  MoveXiangController.m
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/12.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "MoveXiangController.h"
#import "MoveCellMode.h"
@interface MoveXiangController ()<UIWebViewDelegate>

@end

@implementation MoveXiangController



- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    _web4Veiw = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 110)];
    NSURL *url = [NSURL URLWithString:_modelWeb.url_3w];
//    NSLog(@"%@",_modelWeb.url_3w);
    NSURLRequest *ui = [NSURLRequest requestWithURL:url];
    self.web4Veiw.scalesPageToFit = YES;
    self.web4Veiw.delegate = self;
    [self.web4Veiw  loadRequest:ui];
    [self.view addSubview:self.web4Veiw];
    
    [self loadHud];
    

}
#pragma mark --- 加载进度提示框 ----
- (void)loadHud{
    
    self.HUD = [[MBProgressHUD alloc]initWithView:self.view];
    
    [self.view addSubview:self.HUD];
    
    
    self.HUD.dimBackground = YES;
    
    self.HUD.labelText = @"正在加载...";
    
    [self.HUD showAnimated:YES whileExecutingBlock:^{
        sleep(5);
    } completionBlock:^{
        [self.HUD removeFromSuperview];
        self.HUD = nil;
    }];
    
}


#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('article-ad-banner')[0].style.display = 'none'"];
      [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('article-ad-banner')[1].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('header')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('icon-share aside-nav')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('icon-gentie aside-nav')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('iframe')[1].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('aside ')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('article-ad-mixed')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('article-ad-list')[0].style.display = 'none'"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('footer')[0].style.display = 'none'"];
    [self.HUD hide:YES];
    
    
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
