//
//  MovieTableViewController.m
//  LeZhi
//
//  Created by lanou3g on 15/10/7.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "MovieTableViewController.h"
#import "MoveLIstHelper.h"
#import "MoveCellMode.h"
#import "MoveViewCell.h"
#import "MJRefresh.h"
#import "MJRefreshAutoFooter.h"//上拉加载
#import "MJRefreshNormalHeader.h"//下拉刷新


@interface MovieTableViewController ()

@end

@implementation MovieTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //注册
    self.title = @"影视";
    [self.tableView registerNib:[UINib nibWithNibName:@"MoveViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
//    self.view.backgroundColor = [UIColor redColor];
//    [[MoveLIst sharedHelp]requestAllMoveWithFinish:^{
//        NSLog(@"请求完成");
//        [self.tableView reloadData];
//    }];
    [[MoveLIst sharedHelp]requestWithMoveListCellofPage:0 Finsh:^{
        [self.tableView reloadData];
    }];
    
    //上拉加载
    [self.tableView.footer beginRefreshing];
    self.tableView.footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    //下拉刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData1)];
    
    [self.tableView.header beginRefreshing];
    
}

- (void)loadNewData{
    _page += 20;
    [[MoveLIst sharedHelp]requestWithMoveListCellofPage:_page Finsh:^{
        [self.tableView reloadData];
        [self.tableView.footer endRefreshing];
    }];
    
}
- (void)loadNewData1{
    _page = 0;
    [[MoveLIst sharedHelp] requestWithMoveListCellofPage:_page Finsh:^{
        [self.tableView reloadData];
        [self.tableView.header endRefreshing];
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
    //NSLog(@"%ld" ,[MoveLIst sharedHelp].allMoveMutable.count );
    return [MoveLIst sharedHelp].allMove.count;
    
   
   }
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 125;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
    
    
//    MoveViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    
    MoveViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    MoveCellMode * item = [[MoveLIst sharedHelp] itemWithIndex:indexPath.row];
    cell.model = item;

    
    
    
    return cell;
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
