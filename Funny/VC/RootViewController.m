//
//  RootViewController.m
//  Funny
//
//  Created by qianfeng on 15/9/17.
//  Copyright (c) 2015年 __None__. All rights reserved.
//

#import "RootViewController.h"
#import <AFNetworking.h>
#import "FunnyHeader.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (CGFloat)getImageHeightWithUIImageView:(UIImageView *)imgv{
    return SCREEN_WIDTH/imgv.image.size.width*imgv.image.size.height;
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
