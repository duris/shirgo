//
//  HomeViewController.h
//  Pillow
//
//  Created by Ross Duris on 9/5/14.
//  Copyright (c) 2014 Ross. All rights reserved.
//

#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import <ParseUI/ParseUI.h>
#import "FollowButton.h"
#import "DetailButton.h"
#import "DetailViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface HomeViewController : PFQueryTableViewController <FollowButtonDelegate>

@end
