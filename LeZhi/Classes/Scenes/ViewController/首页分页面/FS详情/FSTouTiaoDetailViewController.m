//
//  FSTouTiaoDetailViewController.m
//  LeZhi
//
//  Created by lanou3g on 15/10/12.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "FSTouTiaoDetailViewController.h"
#import "MBProgressHUD.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface FSTouTiaoDetailViewController ()<UIWebViewDelegate>

@property (nonatomic , strong)MBProgressHUD *HUD;

@property (nonatomic , strong)UIView *detailView;

@end

@implementation FSTouTiaoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.detailView = [[UIView alloc]initWithFrame:self.view.bounds];
    
    [self.view addSubview:self.detailView];
    
    [self loadWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIWebView *)loadWebView{
    
    if (_webView == nil) {
        
        
     
        self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 55)];
        self.webView.userInteractionEnabled = YES;
        self.webView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:self.webView];
        
        self.webView.delegate = self;
        
        NSURL *url = [NSURL URLWithString:self.webUrl];
        
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
        
        
        [self.webView loadRequest:request];
    }
    return _webView;
}



#pragma mark -- 代理方法 --
- (void)webViewDidStartLoad:(UIWebView *)webView{

    //[self loadHUD];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('sub_nav')[0].style.display = 'none'"];
    
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('text_comment')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('tuiguang2')[0].style.display = 'none'"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('next ss_none')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('box_share ss_none ipad_block iphone_block clearfix')[0].style.display = 'none'"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('js_hotCmtBlock')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('js_newCmtBlock')[0].style.display = 'none'"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('mod-showAllComment')[0].style.display = 'none'"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('mod-commentTextarea js_textArea')[0].style.display = 'none'"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('yc_news')[0].style.display = 'none'"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('btm_tg')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('add_pic_word')[0].style.display = 'none'"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('hot_word')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('btm_tg')[0].style.display = 'none'"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('jp_list')[0].style.display = 'none'"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('btm_nav')[0].style.display = 'none'"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('yc_news')[0].style.display = 'none'"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('news_pic')[0].style.display = 'none'"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('dt_lsit')[0].style.display = 'none'"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('column-life clearfix')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('yicha_seach')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('ipt-word')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('seach')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('ifengurl')[0].style.display = 'none'"];
    
    [self.HUD hide:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}

- (void)loadHUD{
    
    self.HUD = [[MBProgressHUD alloc]initWithView:self.view];
    
    self.HUD.dimBackground = YES;
    
    self.HUD.labelText = @"请耐心等待...";
    
    [self.view addSubview:self.HUD];
    
    [self.HUD showAnimated:YES whileExecutingBlock:^{
        sleep(7);
    } completionBlock:^{
        
        [self.HUD removeFromSuperview];
        self.HUD = nil;
    }];
    
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
