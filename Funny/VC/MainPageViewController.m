//
//  MainPageViewController.m
//  Funny
//
//  Created by qianfeng on 15/9/17.
//  Copyright (c) 2015年 __None__. All rights reserved.
//

#import "MainPageViewController.h"
#import "NotesPageViewController.h"
#import "FunnyHeader.h"
@interface MainPageViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *backGroundImage;
@property (strong, nonatomic) IBOutlet UIButton *photos;
@property (strong, nonatomic) IBOutlet UIButton *camara;
- (IBAction)noteClick:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *notes;
@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.photos.titleLabel.font = FONT_MW(35.0f);
    self.camara.titleLabel.font = FONT_MW(35.0f);
    self.notes.titleLabel.font  = FONT_MW(20.0f);
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

- (IBAction)noteClick:(id)sender {
    NotesPageViewController *note = [[NotesPageViewController alloc] init];
    note.navigationController.navigationBarHidden = YES;
    [self.navigationController pushViewController:note animated:YES];
}
@end
