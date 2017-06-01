//
//  SecondViewController.m
//  view
//
//  Created by 严琪 on 2017/5/31.
//  Copyright © 2017年 严琪. All rights reserved.
//

#import "SecondViewController.h"
#import "VideoPlayerTableViewCell.h"
#import "FFmpegVideoView.h"

@interface SecondViewController ()<UITableViewDelegate,UITableViewDataSource,VideoTableViewCellDelegate,VideoViewDelegate>
@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic, weak) FFmpegVideoView *currentView;
@end

static NSString * const VideoCell = @"VideoPlayerTableViewCell";

#define CXM_DefaultDownloadUrl (@"http://cdn.video.checheng.com/flvs/0A33363922E51BDE/2017-05-15/2CA3F499517E5894-30.flv")


@implementation SecondViewController


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerNib:[UINib nibWithNibName:@"VideoPlayerTableViewCell" bundle:nil] forCellReuseIdentifier:@"VideoPlayerTableViewCell"];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.tableView reloadData];
}

#pragma tableview的数据

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VideoPlayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:VideoCell];
    [cell.contentView setBackgroundColor:[UIColor blackColor]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    cell.indexPath = indexPath;
    return cell;
    
    return nil;
}


#pragma mark VideoTableViewCell的代理方法
-(void)clickVideoButton:(NSIndexPath *)indexPath {
    VideoPlayerTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if (self.currentView) {
        [self.currentView stop];
    }
    
    NSString *path = CXM_DefaultDownloadUrl;
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    // increase buffering for .wmv, it solves problem with delaying audio frames
    if ([path.pathExtension isEqualToString:@"wmv"])
        parameters[KxMovieParameterMinBufferedDuration] = @(5.0);
    
    // disable deinterlacing for iPhone, because it's complex operation can cause stuttering
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        parameters[KxMovieParameterDisableDeinterlacing] = @(YES);
    
    FFmpegVideoView *view = [[FFmpegVideoView alloc] initWithFrame:cell.frame WithContentPath:path parameters:parameters];
    self.currentView = view;
    view.delegate = self;
    [view initBaseView];
    [cell addSubview:view];
    [view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(cell);
    }];
}



-(void)setUIConfig{
    
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


@end
