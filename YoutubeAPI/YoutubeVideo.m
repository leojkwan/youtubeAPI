//
//  ATRYoutubeVideo.m
//  Atrium
//
//  Created by Leo Kwan on 7/19/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import "YoutubeVideo.h"

@implementation YoutubeVideo


+(YoutubeVideo *) videoFromDictionary:(NSDictionary *) videoDictionary {


    YoutubeVideo *video = [[YoutubeVideo alloc] init];
    
    video.titleOfVideo = videoDictionary[@"snippet"][@"title"];
    video.titleOfChannel = videoDictionary[@"snippet"][@"channelTitle"];
    video.videoID = videoDictionary[@"id"][@"videoId"];
    video.totalViews = videoDictionary[@"snippet"][@""];
    video.thumbnailURL = videoDictionary[@"snippet"][@"thumbnails"][@"high"][@"url"];

    
    return video;
}



@end
