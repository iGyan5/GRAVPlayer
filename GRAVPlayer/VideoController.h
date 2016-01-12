//
//  VideoController.h
//  VideoPlayer
//
//  Created by Gyan Routray on 23/12/15.
//  Copyright © 2015 Gyan Routray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface VideoController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *videoPlayerView;
//@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property(weak,nonatomic) IBOutlet UILabel *lblPage;
@property (nonatomic,assign) BOOL calledFromMenu;
-(IBAction)palyVideo:(id)sender;
- (IBAction)goToVideo:(id)sender;
@end
