//
//  MovieController.m
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/7.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "MovieController.h"

#import "DHMovieTableViewCell.h"
#import "DHMovieHelper.h"

@interface MovieController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;

@end

@implementation MovieController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    
    [self.tableView registerClass:[DHMovieTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [[DHMovieHelper sharedHelp]requestWithFinsh:^{
        NSLog(@"请求数据完成");
        [self.tableView reloadData];
    }];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    
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
    
    return [DHMovieHelper sharedHelp].allMovie.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DHMovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    DHMovieModel * item = [[DHMovieHelper sharedHelp] itemWithIndex:indexPath.row];
    cell.MovieModel = item;
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DHMovieModel * item = [[DHMovieHelper sharedHelp] itemWithIndex:indexPath.row];
    return [self textHeight:item.title]+50 ;
    
    
}
//自适应高度
- (CGFloat)textHeight:(NSString *)str{
    
    
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    
    
    CGRect rect = [str boundingRectWithSize:CGSizeMake(200, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    return rect.size.height;
    
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
