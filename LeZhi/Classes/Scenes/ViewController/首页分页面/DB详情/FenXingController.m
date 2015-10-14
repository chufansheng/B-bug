//
//  FenXingController.m
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/12.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "FenXingController.h"
#import "MoveCellMode.h"

@interface FenXingController ()

@end

@implementation FenXingController

- (void)viewDidLoad {
    [super viewDidLoad];
    _web4VeiwFen = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    NSURL *url = [NSURL URLWithString:_modelWebFen.url_3w];
    NSURLRequest *ui = [NSURLRequest requestWithURL:url];
    self.web4VeiwFen.scalesPageToFit = YES;
    
    [self.web4VeiwFen  loadRequest:ui];
    [self.view addSubview:self.web4VeiwFen];
    // Do any additional setup after loading the view.
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
