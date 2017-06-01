//
//  VideoPlayerTableViewCell.m
//
//
//  Created by 严琪 on 2017/5/26.
//  Copyright © 2017年  . All rights reserved.
//

#import "VideoPlayerTableViewCell.h"

@interface VideoPlayerTableViewCell()<VideoTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *backimg;

@end
@implementation VideoPlayerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)playVideo:(id)sender {
    if ([self.delegate respondsToSelector:@selector(clickVideoButton:)]) {
        [self.delegate clickVideoButton:self.indexPath];
    }
}


@end
