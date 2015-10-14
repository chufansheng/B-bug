//
//  FSHeaderScrollViewController.m
//  LeZhi
//
//  Created by lanou3g on 15/10/13.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "FSHeaderScrollViewController.h"
#import "TouTiaoHelper.h"
#import "OneImageCellModel.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface FSHeaderScrollViewController ()

@property (nonatomic,strong)UIWebView *webView;

@end

@implementation FSHeaderScrollViewController

- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [super viewDidLoad];
   
    if (_isCorrect == YES) {
        [self.webView reload];
    }
    [self.webView reload];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- web方法 --
- (UIWebView*)webView{
    
    if (!_webView) {
        self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth, kScreenHeight - 120)];
        self.webView.backgroundColor = [UIColor blackColor];
        self.webView.scalesPageToFit = YES;
        self.webView.userInteractionEnabled= YES;
        [self.view addSubview:self.webView];
        NSString *str = _url;
        NSURLRequest *request = [[NSURLRequest alloc ]initWithURL:[NSURL URLWithString:str]];
        [self.webView loadRequest:request];
    }
    return _webView;
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
