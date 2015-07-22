//
//  ATRYouTubeAPIClient.m
//  
//
//  Created by Leo Kwan on 7/19/15.
//
//

#import "YouTubeAPIClient.h"
#import "Constants.h"
#import <AFNetworking.h>


@implementation YouTubeAPIClient

NSString *const YOUTUBE_SEARCH_URL = @"https://www.googleapis.com/youtube/v3/search";
NSString *const YOUTUBE_STATS_URL = @"https://www.googleapis.com/youtube/v3/videos";


+(void) getVideosWithQuery:(NSString *)query completionBlock:(void (^) (NSDictionary *)) completionBlock {
    
    
    
    // Create a dictionary that contains all required and optional params. ("part" is the only required param"
    NSDictionary *params = @{
                             
                                                      @"part" : @"snippet",
                                                     @"q": query,
                                                     @"order": @"viewCount",
                                                    @"key" : YOUTUBE_API_KEY};

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:YOUTUBE_SEARCH_URL parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        // code here
        NSLog(@"%@", responseObject);
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        // code here
        NSLog(@"%@", error);
    }];

}

+(void) getVideosStatsWithVideoID:(NSString *)videoID completionBlock:(void (^) (NSDictionary *)) completionBlock {

    NSDictionary *params = @{
                             @"part": @"statistics",
                             @"id": videoID,
                             @"key" : YOUTUBE_API_KEY};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:YOUTUBE_STATS_URL parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
    

}





@end
