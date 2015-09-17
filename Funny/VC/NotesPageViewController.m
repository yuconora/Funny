//
//  NotesPageViewController.m
//  Funny
//
//  Created by qianfeng on 15/9/17.
//  Copyright (c) 2015年 __None__. All rights reserved.
//

#import "NotesPageViewController.h"
#import "bottomView.h"
#import "FunnyHeader.h"
#import "NotesCell.h"
#import "DetailPageViewController.h"
@interface NotesPageViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tb;
    NSMutableArray *_dataSource;
    NotesCell *cell;
}

@end

@implementation NotesPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadFirstPageData];
    [self initUI];
}
- (void)loadFirstPageData{
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:JGProgressHUDStyleDark];
    [hud showInView:self.view animated:YES];
    NSURL *url = [NSURL URLWithString:PLIST_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFCompoundResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *data = [NSData dataWithData:responseObject];
        NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/"];
        [data writeToFile:[NSString stringWithFormat:@"%@%@",path,@"first.plist"] atomically:YES];
        [hud dismissAnimated:YES];
        [self initDataSource];
        [_tb reloadData];
        NSLog(@"%@",NSHomeDirectory());

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    [operation start];

}

- (void)initDataSource{
    _dataSource = [NSMutableArray array];
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/first.plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *d in array) {
        NoteModel *model = [[NoteModel alloc] init];
        [model setValuesForKeysWithDictionary:d];
        [_dataSource addObject:model];
    }
    [self createTb];
}
- (void)createTb{
    _tb = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT-VIEWHEIGHT-20) style:UITableViewStylePlain];
    _tb.backgroundColor = [UIColor clearColor];
    _tb.dataSource = self;
    _tb.delegate = self;
    [self.view addSubview:_tb];
    [_tb registerNib:[UINib nibWithNibName:@"NotesCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NoteModel *model = _dataSource[indexPath.row];
    [cell createCellUIWithModel:model];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailPageViewController *detail = [[DetailPageViewController alloc] init];
    detail.navigationController.navigationBarHidden = YES;
    detail.leftImage = cell.cellImg.image;
    detail.preViewUrl = [NSString stringWithFormat:@"%@%@/%@Preview.png",PIC_URL,[_dataSource[indexPath.row] Prefix],[_dataSource[indexPath.row] Prefix]];
    detail.titleText = [_dataSource[indexPath.row] NameSC];
    detail.totalSize = [_dataSource[indexPath.row] Size];
    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}
- (void)initUI{
    self.view.backgroundColor = [UIColor colorWithRed:0.985 green:1.000 blue:0.937 alpha:1.000];
    self.bottomView = [[[NSBundle mainBundle] loadNibNamed:@"bottomView" owner:nil options:nil] lastObject];
    self.bottomView.frame = CGRectMake(0,SCREEN_HEIGHT-VIEWHEIGHT, SCREEN_WIDTH, VIEWHEIGHT);
    self.bottomView.backgroundColor = self.view.backgroundColor;
    [self.view addSubview:self.bottomView];
    [self.bottomView.goback addTarget:self action:@selector(goback:) forControlEvents:UIControlEventTouchUpInside];
    self.bottomView.goback.titleLabel.font  = FONT_MW(15.0f);
    self.bottomView.about.titleLabel.font   = FONT_MW(15.0f);
    self.bottomView.manager.titleLabel.font = FONT_MW(15.0f);
}

- (void)goback:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
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
