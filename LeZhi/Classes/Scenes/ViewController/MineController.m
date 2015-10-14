//
//  MineController.m
//  LeZhi
//
//  Created by S༻D༻B༻ on 15/10/7.
//  Copyright © 2015年 褚凡生. All rights reserved.
//

#import "MineController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface MineController ()<UITableViewDelegate , UITableViewDataSource>

@property (nonatomic , strong) UITableView *mainTableView;

@property (nonatomic , strong) NSArray *dataArray;

@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    // Do any additional setup after loading the view.
    
    self.mainTableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    self.mainTableView.frame = CGRectMake(0, 0, kScreenWidth , kScreenHeight - 55);
    
    self.mainTableView.backgroundColor = [UIColor whiteColor];
    
    self.mainTableView.delegate = self;
    
    self.mainTableView.dataSource = self;
    
    [self.view addSubview:self.mainTableView];
    
    [self.mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.dataArray = @[@[@"我的收藏"],@[@"当前版本"]];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.dataArray[section]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.section][indexPath.row];
    
    return cell;
    
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
