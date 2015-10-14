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
#import "UIImageView+WebCache.h"
#import "MoveFenViewCell.h"
#import "MoveXiangController.h"

@interface MovieTableViewController ()

@property (nonatomic,strong) UIImageView *bigImg1;
@property (nonatomic,strong) MoveCellMode *bigImgModel;

@end

@implementation MovieTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //注册
    self.title = @"影视";
    [self.tableView registerNib:[UINib nibWithNibName:@"MoveViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
   //注册分栏
    [self.tableView registerNib:[UINib nibWithNibName:@"MoveFenViewCell" bundle:nil] forCellReuseIdentifier:@"fen"];
  
    self.bigImg1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];

    [[MoveLIst sharedHelp]requestWithMoveListCellofPage:0 Finsh:^{
        
    [self.bigImg1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[MoveLIst sharedHelp].bigImg[0]]]];
    self.tableView.tableHeaderView = self.bigImg1;

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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [MoveLIst sharedHelp].fenImg.count;
    
   
   }

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    MoveCellMode *item = [MoveLIst sharedHelp].fenImg[indexPath.row];

    if (item.imgextra == nil) {
        return 125;
    }
      return 175;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    MoveCellMode *item = [MoveLIst sharedHelp].fenImg[indexPath.row];
    if (item.imgextra==nil) {
        MoveViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.model = item;
        return cell;
    }else{
        MoveFenViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fen" forIndexPath:indexPath];
        cell.model1= item;
    
        return cell;
    
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MoveCellMode *item = [MoveLIst sharedHelp].fenImg[indexPath.row];
    if(item.imgextra == nil){
        MoveXiangController *MoveXiang = [[MoveXiangController alloc]init];
        MoveCellMode *item1 = [MoveLIst sharedHelp].fenImg[indexPath.row];
        
        MoveXiang.modelWeb = item1;
        [self.navigationController showViewController:MoveXiang sender:nil];
        
        
        
    }else{
        
        //        FenXingController *moveXiangFen = [[FenXingController alloc]init];
        //        DBMoveModel *item2 = [[DBMoveListHelper shanreMoveListHelper] itemWithIndex:indexPath.row];
        //        moveXiangFen.modelWebFen = item2;
        //        [self.navigationController pushViewController:moveXiangFen animated:YES];
    }
    
    
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
