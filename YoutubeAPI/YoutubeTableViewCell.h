//
//  YoutubeTableViewCell.h
//  YoutubeAPI
//
//  Created by Leo Kwan on 7/22/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YoutubeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *videoThumbnail;
@property (weak, nonatomic) IBOutlet UILabel *videoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *channelNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *viewCountLabel;

@end
