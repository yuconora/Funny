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
@property (nonatomic,strong)    NSString   *picUrl;
@property (nonatomic,strong)    NSString *titleText;
@property (nonatomic,strong)    NSString *totalSize;
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
- (void)dealloc{
    _img = nil;
    _nModel = nil;
    _sc = nil;
    _bootView = nil;
    _topView = nil;
    _downBtn  =nil;
    _titleLabel = nil;
    _sizeLabel = nil;
    _sizeLabel = nil;
    _backBtn = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createUI];
    [self createSc];
}
- (void)createUI{
    [self.img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@/%@0.png",PIC_URL,self.nModel.Prefix,self.nModel.Prefix]]];
    self.picUrl = [NSString stringWithFormat:@"%@%@/%@",PIC_URL,self.nModel.Prefix,self.nModel.Prefix];
    self.downBtn.titleLabel.font = FONT_MW(25.0f);
    self.titleLabel.font         = FONT_MW(25.0f);
    self.sizeLabel.font          = FONT_MW(20.0f);
    self.backBtn.titleLabel.font = FONT_MW(18.0f);
    self.titleLabel.text         = self.nModel.NameSC;
    self.sizeLabel.text          = self.nModel.Size;

}

- (void)createSc{
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-40, _sc.frame.size.height)];
    [imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@Preview.png",self.picUrl]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        imageV.contentMode = UIViewContentModeScaleAspectFit;
        CGFloat h = [self getImageHeightWithUIImageView:imageV byWidth:SCREEN_WIDTH-40];
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

- (void)downLoadPic{
    NSURL *url = [NSURL URLWithString:PLIST_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFCompoundResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *data = [NSData dataWithData:responseObject];
        NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/"];
        [data writeToFile:[NSString stringWithFormat:@"%@%@",path,@"first.plist"] atomically:YES];
        NSLog(@"%@",NSHomeDirectory());

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    [operation start];
}
@end
