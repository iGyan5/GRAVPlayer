//
//  VideoController.m
//  VideoPlayer
//
//  Created by Gyan Routray on 23/12/15.
//  Copyright © 2015 Gyan Routray. All rights reserved.
//

#import "VideoController.h"
//#import "ViewControllerOne.h"
//#import "NavigationButtons.h"
@interface VideoController ()
{
    AVPlayer *player;
}
@end

@implementation VideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.videoPlayerView.delegate=self;
    self.videoPlayerView.backgroundColor   =  [UIColor clearColor];
    
    
//    NavigationButtons *navButtons=[NavigationButtons instance];
//    NSString *pageNumber=[NSString stringWithFormat:@"Page== %d",(int)[navButtons countValue]];
//    self.lblPage.text=pageNumber;

//    if (self.calledFromMenu) {
//    [navButtons.btnMenu addTarget:self action:@selector(menuCalled) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *barBtn=[navButtons btnBar];
//        self.navigationItem.leftBarButtonItem=barBtn;
//
//    }
//    else{
//        UIBarButtonItem *barBtn=[navButtons btnBarBack];
//        self.navigationItem.leftBarButtonItem=barBtn;
//    }
    
}
-(void)addVideo{
    NSURL *videoURL = [NSURL URLWithString:@"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    player = [AVPlayer playerWithURL:videoURL];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.frame = self.view.frame;
    [self.videoPlayerView.layer addSublayer:playerLayer];
 //   AVPlayerItem *avPlayerItem=[[AVPlayerItem alloc]initWithAsset:];
 
}
-(IBAction)palyVideo:(id)sender{
    if (player.rate==0) {
        [player play];
    }
    else{
        [player pause];
    }
    
    //For navigation
    //    ViewControllerOne *one=[[ViewControllerOne alloc]initWithNibName:@"ViewControllerOne" bundle:nil];
    //    [self.navigationController pushViewController:one animated:YES];
    
}

-(void)menuCalled{
    NSLog(@"Menu called");
}

-(IBAction)prepareThumbnail:(id)sender{
    
    NSString *yourVideoLink = @"https://www.youtube.com/watch?v=Bzt6h5uFWOU";
    NSString * youtubeID = @"Bzt6h5uFWOU";
    NSString *yourlinkThumbnail = [NSString stringWithFormat:@"http://img.youtube.com/vi/%@/0.jpg",youtubeID];
    NSString *embedHTML = @"\
    <html><head>\
    <style type=\"text/css\">\
    body {\
    background-color: transparent;\
    color: white;\
    }\
    </style>\
    <script>\
    function load(){document.getElementById(\"yt\").play();}\
    </script>\
    </head><body onload=\"load()\"style=\"margin:0\">\
    <video id=\"yt\" src=\"%@\" \
    width=\"%0.0f\" height=\"%0.0f\" poster=\"%@\" autoplay controls></video>\
    </body></html>";
    NSString *html = [NSString stringWithFormat:embedHTML, yourVideoLink, self.videoPlayerView.frame.size.width, self.videoPlayerView.frame.size.height,yourlinkThumbnail];
    [self.videoPlayerView loadHTMLString:html baseURL:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoPlayStarted:) name:@"UIMoviePlayerControllerDidEnterFullscreenNotification" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoPlayFinished:) name:@"UIMoviePlayerControllerDidExitFullscreenNotification" object:nil];
    //[self playVideo];
    
   }
-(void)viewDidAppear:(BOOL)animated{
   // [[NavigationButtons instance] setCount:0];
}

- (IBAction)goToVideo:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)playVideo{
    NSString *html =  [NSString stringWithFormat:@"<iframe margin=\"0\" padding=\"0\" width=\"%f\" height=\"%f\" src=https://www.youtube.com/embed/pvAsqPbz9Ro frameborder=\"0\" allowfullscreen></iframe>",350.0,250.0];
    [self.videoPlayerView loadHTMLString:html baseURL:nil];
}
-(void)videoPlayStarted:(NSNotification *)notification{
    //self.isInFullScreenMode = YES;
}

-(void)videoPlayFinished:(NSNotification *)notification{
    // your code here
    // self.isInFullScreenMode = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
