//
//  ATRYoutubeVideo.h
//  Atrium
//
//  Created by Leo Kwan on 7/19/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YoutubeVideo : NSObject

@property (nonatomic, strong) NSString *titleOfVideo;
@property (nonatomic, strong) NSString *titleOfChannel;
@property (nonatomic, strong) NSString *videoID;
@property (nonatomic, strong) NSString *totalViews;
@property (nonatomic, strong) NSString *thumbnailURL;


+(YoutubeVideo *) videoFromDictionary:(NSDictionary *) videoDictionary;

@end
