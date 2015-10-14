//
//  TouTiaoTableViewController.m
//  LeZhi
//
//  Created by lanou3g on 15/10/7.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "TouTiaoTableViewController.h"

#import "MJRefresh.h"
#import "MJRefreshAutoFooter.h"
#import "MJRefreshNormalHeader.h"

#import "OneImageCellModel.h"

#import "TouTiaoHelper.h"

#import "TouTiaoTableViewCell.h"

@interface TouTiaoTableViewController ()

@end

@implementation TouTiaoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[TouTiaoHelper shanreTouTiaoHelper]requestWithTouTiaoListCellofPage:1 Finsh:^{
        [self.tableView reloadData];
    }];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TouTiaoTableViewCell" bundle:nil] forCellReuseIdentifier:@"TouTiaoCell"];
    
    
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
    return [TouTiaoHelper shanreTouTiaoHelper].allTouTiaoListArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TouTiaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TouTiaoCell" forIndexPath:indexPath];
    
   // cell.oneImeCellModel = [TouTiaoHelper shanreTouTiaoHelper].allTouTiaoListArr[indexPath.row];
    
    NSLog(@"11111");
    
    
    
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
