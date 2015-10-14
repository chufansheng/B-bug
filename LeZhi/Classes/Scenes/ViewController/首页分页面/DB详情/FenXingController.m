//
//  FenXingController.m
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/12.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "FenXingController.h"
#import "MoveCellMode.h"

@interface FenXingController ()<UIWebViewDelegate>

@end

@implementation FenXingController

- (void)viewDidLoad {
    [super viewDidLoad];
    _web4VeiwFen = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    NSURL *url = [NSURL URLWithString:self.url];
    NSLog(@"%@",self.url);
    NSURLRequest *ui = [NSURLRequest requestWithURL:url];
    self.web4VeiwFen.scalesPageToFit = YES;
    self.web4VeiwFen.delegate = self;
    [self.web4VeiwFen  loadRequest:ui];
    [self.view addSubview:self.web4VeiwFen];
    // Do any additional setup after loading the view.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('nav cf')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('sidebar')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('hotset-sets-list-wrap')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('hotset-tab-last hotset-tab-ad')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('hotset-tab cf')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('hotset-cont')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"ddocument.getElementsByClassName('other-content')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('tie-area')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('gallery-gray-area')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('gallery-guess-wrapper')[0].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('top cf')[0].style.display = 'none'"];
    
     [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('top-line')[0].style.display = 'none'"];
    
   
}

- (void)didReceiveMemoryWarning {    [super didReceiveMemoryWarning];
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
