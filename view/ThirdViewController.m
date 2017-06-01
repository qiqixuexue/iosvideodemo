//
//  ThirdViewController.m
//  view
//
//  Created by 严琪 on 2017/6/1.
//  Copyright © 2017年 严琪. All rights reserved.
//

#import "ThirdViewController.h"
#import "FFmpegVideoView.h"

@interface ThirdViewController ()
@property (nonatomic, weak) FFmpegVideoView *currentView;
@end

#define CXM_DefaultDownloadUrl (@"http://cdn.video.checheng.com/flvs/0A33363922E51BDE/2017-05-15/2CA3F499517E5894-30.flv")

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSString *path = CXM_DefaultDownloadUrl;
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    // increase buffering for .wmv, it solves problem with delaying audio frames
    if ([path.pathExtension isEqualToString:@"wmv"])
        parameters[KxMovieParameterMinBufferedDuration] = @(5.0);
    
    // disable deinterlacing for iPhone, because it's complex operation can cause stuttering
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        parameters[KxMovieParameterDisableDeinterlacing] = @(YES);
    
    FFmpegVideoView *view = [[FFmpegVideoView alloc] initWithFrame:CGRectZero WithContentPath:path parameters:parameters];
    self.currentView = view;
    [self.currentView initBaseView];
    [self.view addSubview:view];
    [view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.mas_equalTo(kwidth);
        make.height.mas_equalTo(300);
    }];

    
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (self.currentView) {
        [self.currentView stop];
    }
    
    //    self.navigationController.navigationBar.alpha = 1;
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
