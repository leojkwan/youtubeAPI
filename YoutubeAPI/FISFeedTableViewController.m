//
//  FISFeedTableViewController.m
//  
//
//  Created by Leo Kwan on 7/22/15.
//
//

#import "FISFeedTableViewController.h"
#import "YouTubeAPIClient.h"
#import "YoutubeTableViewCell.h"
#import "YoutubeVideo.h"


@interface FISFeedTableViewController ()

@property (nonatomic, strong) NSMutableArray *FISVideoResultsArray;

@end

@implementation FISFeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    self.FISVideoResultsArray = [[NSMutableArray alloc] init];
    

    [YouTubeAPIClient getVideosWithQuery:@"FlatironSchool" completionBlock:^(NSDictionary *response) {
        for (NSDictionary *video in response[@"items"]) {
            YoutubeVideo *videoAtThisIndex = [YoutubeVideo videoFromDictionary:video];
            [self.FISVideoResultsArray addObject:videoAtThisIndex];
            NSLog(@"%@",self.FISVideoResultsArray);
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];
            NSLog(@"%lu" ,self.FISVideoResultsArray.count);
            
        }];
        
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.FISVideoResultsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YoutubeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"youtubeReuseCell" forIndexPath:indexPath];
    
    
    YoutubeVideo *videoAtThisRow = self.FISVideoResultsArray[indexPath.row];
    
    //CONVERT IMAGE URL TO UIIMAGE
    NSURL* imageURL = [NSURL URLWithString:videoAtThisRow.thumbnailURL];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    
    cell.videoThumbnail.image = image;
    
    //SET UI LABELS WITH VIDEO INFO
    cell.videoTitleLabel.text =videoAtThisRow.titleOfVideo;
    cell.channelNameLabel.text = videoAtThisRow.titleOfChannel;
    cell.viewCountLabel.text = [NSString stringWithFormat:@"%@ views", videoAtThisRow.totalViews];
    NSLog(@"%@", videoAtThisRow);

    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
