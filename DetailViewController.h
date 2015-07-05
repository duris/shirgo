//
//  DetailViewController.h
//  Pillow
//
//  Created by Ross Duris on 11/25/14.
//  Copyright (c) 2014 Ross. All rights reserved.
//

#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface DetailViewController : PFQueryTableViewController
@property (nonatomic, assign) NSString *nameDetail;
@end
