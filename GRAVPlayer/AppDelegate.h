//
//  AppDelegate.h
//  GRAVPlayer
//
//  Created by Gyan Routray on 25/12/15.
//  Copyright © 2015 Gyan Routray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,retain) VideoController *videoController;

@end

