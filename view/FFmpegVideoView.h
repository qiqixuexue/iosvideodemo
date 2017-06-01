//
//  FFmpegVideoView.h
//  
//
//  Created by 严琪 on 2017/5/26.
//  Copyright © 2017年 . All rights reserved.
//

#import <UIKit/UIKit.h>
@class KxMovieDecoder;

@protocol VideoViewDelegate

@optional

-(void) setUIConfig;

@end

extern NSString * const KxMovieParameterMinBufferedDuration;    // Float
extern NSString * const KxMovieParameterMaxBufferedDuration;    // Float
extern NSString * const KxMovieParameterDisableDeinterlacing;   // BOOL

@interface FFmpegVideoView : UIView

-(instancetype)initWithFrame:(CGRect)frame WithContentPath: (NSString *) path
                  parameters: (NSDictionary *) parameters;

@property (readonly) BOOL playing;

// 委托代理人，代理一般需使用弱引用(weak)
@property (weak, nonatomic) id delegate;


- (void) initBaseView;
- (void) play;
- (void) pause;
- (void) stop;


@end
