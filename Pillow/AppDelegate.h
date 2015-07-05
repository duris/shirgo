//
//  AppDelegate.h
//  Pillow
//
//  Created by Ross Duris on 8/29/14.
//  Copyright (c) 2014 Ross. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParseLoginViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIPageViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableData *profilePictureData;

- (void)presentLoginControllerAnimated:(BOOL)animated;

@end
