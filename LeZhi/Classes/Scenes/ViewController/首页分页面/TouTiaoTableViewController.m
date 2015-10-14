//
//  TouTiaoTableViewController.m
//  LeZhi
//
//  Created by lanou3g on 15/10/7.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "TouTiaoTableViewController.h"
#import "URLPicture.h"
//刷新加载
#import "MJRefresh.h"
#import "MJRefreshAutoFooter.h"
#import "MJRefreshNormalHeader.h"
//轮播第三方
#import "SDCycleScrollView.h"
//进度提示框
#import "MBProgressHUD.h"

#import "OneImageCellModel.h"

#import "TouTiaoHelper.h"

#import "TouTiaoTableViewCell.h"
#import "TouTiaoThreeViewCell.h"
//详情页
#import "FSTouTiaoDetailViewController.h"
#import "FSHeaderScrollViewController.h"

@interface TouTiaoTableViewController ()<SDCycleScrollViewDelegate>

@property (nonatomic , strong) NSMutableArray *locklListArr;

@property (nonatomic , strong) NSMutableArray *headerImgArr;

@property (nonatomic , assign) NSUInteger pageSize;

@property (nonatomic , strong) MBProgressHUD *HUD;


@end

@implementation TouTiaoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[TouTiaoHelper new]requestWithHeaderImgUrl:kTouTiaoUrl(_pageSize) Finsh:^(NSMutableArray *array) {
       
        self.headerImgArr = array;
        [self addScrollImg];
        [self.tableView.header beginRefreshing];
        [self.HUD hide:YES];
        [self.tableView.header endRefreshing];
    }];
    
    
    //tableViewCell分割线隐藏
   // self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //加载进度提示框
    [self loadHud];
    
   //list网络加载
//  [[TouTiaoHelper new]requestWithTouTiaoListCellofPage:_pageSize Finsh:^(NSMutableArray *array) {
//      
//      self.locklListArr = array;
//      [self.tableView.header beginRefreshing];
//      [self.tableView reloadData];
//      
//  }];
    
    //==================实验=====================
    
    
    [[TouTiaoHelper new]requestWithListCellofUrl:kTouTiaoUrl(_pageSize) Finsh:^(NSMutableArray *array) {
        self.locklListArr = array;
        [self.tableView.header beginRefreshing];
        [self.tableView reloadData];
    }];
    
    
#pragma mark -- 注册cell
    //注册单图cell
    [self.tableView registerNib:[UINib nibWithNibName:@"TouTiaoTableViewCell" bundle:nil] forCellReuseIdentifier:@"TouTiaoCell"];
    
    //注册多图cell
    [self.tableView registerNib:[UINib nibWithNibName:@"TouTiaoThreeViewCell" bundle:nil] forCellReuseIdentifier:@"ThreeCell"];
    
    
    //下拉刷新
    [self.tableView.header beginRefreshing];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshListCell)];
    
    self.tableView.footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadListCell)];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.locklListArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    OneImageCellModel *model = self.locklListArr[indexPath.row];
    
    if ([model.type isEqualToString:@"doc"] || [model.type isEqualToString:@"web"]) {
        
        return 90;
    } else {
        return 150;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OneImageCellModel *model = self.locklListArr[indexPath.row];
    
    if ([model.type isEqualToString:@"slide"]) {
        
        TouTiaoThreeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThreeCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = model;
        return cell;
        
    }else{
        
        TouTiaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TouTiaoCell" forIndexPath:indexPath];
        cell.oneImeCellModel = model;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}

#pragma mark -- cell点击方法 --
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    OneImageCellModel *webModel = self.locklListArr[indexPath.row];
    
    FSTouTiaoDetailViewController *toutiaoDetail = [[FSTouTiaoDetailViewController alloc]init];
    
    toutiaoDetail.webUrl = webModel.commentsUrl;
    

    
    [self.navigationController pushViewController:toutiaoDetail animated:YES];
    
}



#pragma mark ------ 刷新加载 --------

//下拉
- (void)refreshListCell{
    
    _pageSize = 1;

    [[TouTiaoHelper new]requestWithListCellofUrl:kTouTiaoUrl(_pageSize) Finsh:^(NSMutableArray *array) {
       
        self.locklListArr = array;
        [self.tableView reloadData];
        [self.tableView.header endRefreshing];
        
    }];
    
}
//上拉
- (void)loadListCell{
    
    _pageSize += 1;
    
    [[TouTiaoHelper new]requestWithListCellofUrl:kTouTiaoUrl(_pageSize) Finsh:^(NSMutableArray *array) {
        [self.locklListArr addObjectsFromArray:array];
        [self.tableView reloadData];
        [self.tableView.footer endRefreshing];
        
    }];
    
}

#pragma mark --- 加载轮播图 --- 
- (void)addScrollImg{

    NSMutableArray *array1 = [[NSMutableArray alloc]initWithCapacity:6];
    NSMutableArray *titleArr = [[NSMutableArray alloc]initWithCapacity:2];
    for (int i = 0; i < self.headerImgArr.count; i ++) {
        OneImageCellModel *scrollModel = [OneImageCellModel new];
        scrollModel = self.headerImgArr[i];
        NSString *str = scrollModel.thumbnail;
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",str]];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        UIImage *img = [UIImage imageWithData:data];
        [array1 addObject:img];
        [titleArr addObject:[scrollModel title]];
    }
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) imagesGroup:array1];
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView.titlesGroup = titleArr;
    cycleScrollView.autoScrollTimeInterval = 3;
    cycleScrollView.delegate = self;
    [self.view addSubview:cycleScrollView];
    self.tableView.tableHeaderView = cycleScrollView;
    
}

#pragma mark -- 轮播图点击方法---

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
   FSHeaderScrollViewController *headerScrollDetilView = [[FSHeaderScrollViewController alloc]init];
    
    NSString *string = [self.headerImgArr[index] commentsUrl];
    
    headerScrollDetilView.url = string;
    
    [self.navigationController pushViewController:headerScrollDetilView animated:NO];
    
}



#pragma mark --- 加载进度提示框 ----
- (void)loadHud{
    
    self.HUD = [[MBProgressHUD alloc]initWithView:self.view];
    
    [self.view addSubview:self.HUD];
    
    self.HUD.dimBackground = YES;
    
    self.HUD.labelText = @"正在加载...";
    
    [self.HUD showAnimated:YES whileExecutingBlock:^{
        sleep(1000);
    } completionBlock:^{
        [self.HUD removeFromSuperview];
        self.HUD = nil;
    }];
    
    [self.HUD showAnimated:YES whileExecutingBlock:^{
        sleep(10000);
    } completionBlock:^{
        [self.HUD removeFromSuperview];
        self.HUD  = nil;
    }];
    
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
