//
//  DetailPageViewController.m
//  Funny
//
//  Created by qianfeng on 15/9/17.
//  Copyright (c) 2015年 __None__. All rights reserved.
//

#import "DetailPageViewController.h"
#import "FunnyHeader.h"
@interface DetailPageViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *sc;
@property (strong, nonatomic) IBOutlet UIView *bootView;
@property (strong, nonatomic) IBOutlet UIView *topView;
@property (strong, nonatomic) IBOutlet UIImageView *img;
@property (strong, nonatomic) IBOutlet UIButton *downBtn;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
- (IBAction)downBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *sizeLabel;
@property (strong, nonatomic) IBOutlet UIButton *backBtn;
- (IBAction)backBtnClick:(id)sender;
@end

@implementation DetailPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createUI];
    [self createSc];
}

- (void)createUI{
    self.img.image               = self.leftImage;
    self.downBtn.titleLabel.font = FONT_MW(18.0f);
    self.titleLabel.font         = FONT_MW(18.0f);
    self.sizeLabel.font          = FONT_MW(16.0f);
    self.backBtn.titleLabel.font = FONT_MW(18.0f);
    self.titleLabel.text         = self.titleText;
    self.sizeLabel.text          = self.totalSize;

}

- (void)createSc{
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-40, _sc.frame.size.height)];
    [imageV sd_setImageWithURL:[NSURL URLWithString:self.preViewUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        CGFloat h = [self getImageHeightWithUIImageView:imageV];
        CGRect frame = imageV.frame;
        frame.size.height = h;
        imageV.frame = frame;
        [_sc addSubview:imageV];
        _sc.contentSize = CGSizeMake(_sc.frame.size.width, imageV.frame.size.height);
    }];
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

- (IBAction)backBtnClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)downBtn:(id)sender {
    NSLog(@"下载");
}
@end
