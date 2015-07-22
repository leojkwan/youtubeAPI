//
//  ATRYouTubeAPIClient.h
//  
//
//  Created by Leo Kwan on 7/19/15.
//
//

#import <Foundation/Foundation.h>

//NSString *const YOUTUBE_API_KEY;

@interface YouTubeAPIClient : NSObject


+(void) getVideosWithQuery:(NSString *)query completionBlock:(void (^) (NSDictionary *)) completionBlock;
+(void) getVideosStatsWithVideoID:(NSString *)videoID completionBlock:(void (^) (NSDictionary *)) completionBlock;




@end
