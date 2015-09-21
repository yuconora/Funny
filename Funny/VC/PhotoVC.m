//
//  PhotoVC.m
//  Funny
//
//  Created by qianfeng on 15/9/20.
//  Copyright © 2015年 __None__. All rights reserved.
//

#import "PhotoVC.h"
#import "PaintView.h"
#import "FunnyHeader.h"
@interface PhotoVC ()

@end

@implementation PhotoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createImageV];
    PaintView *paint = [[[NSBundle mainBundle] loadNibNamed:@"PaintView" owner:nil options:nil] lastObject];
    paint.frame = self.view.bounds;
    [self.view addSubview:paint];
    
}

- (void)createImageV{
    UIImageView *ima = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT-90-20)];
    ima.contentMode = UIViewContentModeScaleAspectFit;
    ima.image = [UIImage imageNamed:@"BG6"];
    [self.view addSubview:ima];
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
