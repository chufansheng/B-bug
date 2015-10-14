//
//  GirlViewController.m
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/13.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "GirlViewController.h"
#import "DBGirlListHelper.h"
#import "MJRefresh.h"
#import "MJRefreshAutoFooter.h"//上拉加载
#import "MJRefreshNormalHeader.h"//下拉刷新
#import "DBGirlCell.h"
@interface GirlViewController ()

@end

@implementation GirlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:@"DBGirlCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [[DBGirlListHelper shanreGirlListHelper]requestWithGirlListCellofPage:0 Finsh:^{
        
    [self.tableView reloadData];
    }];
    //上拉加载
    [self.tableView.footer beginRefreshing];
    self.tableView.footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    //下拉刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData1)];
    
    [self.tableView.header beginRefreshing];
    
}
#pragma mark --刷新加载--
- (void)loadNewData
{
    _page += 1;
    [[DBGirlListHelper shanreGirlListHelper]requestWithGirlListCellofPage:0 Finsh:^{
        
        [self.tableView reloadData];
    }];

    
}
- (void)loadNewData1{
    _page = 0;
    [[DBGirlListHelper shanreGirlListHelper]requestWithGirlListCellofPage:0 Finsh:^{
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [DBGirlListHelper shanreGirlListHelper].allGirimg.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 510;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DBGirlCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //[cell setSelectedBackgroundView:[[UIView alloc] init]] ;
    DBGirlModel *item = [[DBGirlListHelper shanreGirlListHelper] itemWithIndex:indexPath.row];
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
