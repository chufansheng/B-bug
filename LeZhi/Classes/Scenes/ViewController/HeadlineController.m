//
//  HeadlineController.m
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/7.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "HeadlineController.h"

#import "SCNavTabBarController.h"

#import "TouTiaoTableViewController.h"
#import "YuLeTableViewController.h"
#import "SportTableViewController.h"
#import "MovieTableViewController.h"
#import "GirlViewController.h"



@interface HeadlineController ()

@end

@implementation HeadlineController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"推荐";

    TouTiaoTableViewController *toutiaoVC = [[TouTiaoTableViewController alloc]init];
    toutiaoVC.title = @"头条";
    
    YuLeTableViewController *yuleVC = [[YuLeTableViewController alloc]init];
    yuleVC.title = @"娱乐";
    
    SportTableViewController *sportVC = [[SportTableViewController alloc]init];
    sportVC.title = @"体育";
    
    MovieTableViewController *movieVC = [[MovieTableViewController alloc]init];
    movieVC.title = @"影视";
    
    GirlViewController *girlVC = [[GirlViewController alloc]init];
    girlVC.title = @"美女";
    
    
    SCNavTabBarController *navTabControll = [[SCNavTabBarController alloc]init];
    navTabControll.subViewControllers = @[toutiaoVC,yuleVC,sportVC,movieVC,girlVC];
    navTabControll.showArrowButton = NO;
    [navTabControll addParentController:self];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
