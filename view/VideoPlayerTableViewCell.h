//
//  VideoPlayerTableViewCell.h
//
//
//  Created by 严琪 on 2017/5/26.
//  Copyright © 2017年  . All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  VideoTableViewCellDelegate<NSObject>

@optional

-(void)clickVideoButton:(NSIndexPath *)indexPath;

@end
@interface VideoPlayerTableViewCell : UITableViewCell

@property (nonatomic, weak) id<VideoTableViewCellDelegate> delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;

 

@end
