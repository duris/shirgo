//
//  ProfileViewController.m
//  Pillow
//
//  Created by Ross Duris on 10/31/14.
//  Copyright (c) 2014 Ross. All rights reserved.
//

#import "ProfileViewController.h"
#import "AppDelegate.h"

@interface ProfileViewController ()

@property (weak, nonatomic) IBOutlet UILabel *followerNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet PFImageView *userImageView;


@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.userImageView.layer.cornerRadius = self.userImageView.frame.size.width/2;
    self.userImageView.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateUserStatus];
}

- (void)updateUserStatus {
    PFUser *user = [PFUser currentUser];
    self.userImageView.file = user[@"profilePicture"];
    [self.userImageView loadInBackground];
    self.userNameLabel.text = user.username;
    
    PFQuery *followingQuery = [PFQuery queryWithClassName:@"Activity"];
    [followingQuery whereKey:@"fromUser" equalTo:user];
    [followingQuery whereKey:@"type" equalTo:@"follow"];
    [followingQuery findObjectsInBackgroundWithBlock:^(NSArray *followingActivities, NSError *error) {
        if (!error) {
            self.followingNumberLabel.text = [[NSNumber numberWithInteger:followingActivities.count] stringValue];
        }
    }];
    
    PFQuery *followerQuery = [PFQuery queryWithClassName:@"Activity"];
    [followerQuery whereKey:@"toUser" equalTo:user];
    [followerQuery whereKey:@"type" equalTo:@"follow"];
    [followerQuery findObjectsInBackgroundWithBlock:^(NSArray *followerActivities, NSError *error) {
        if (!error) {
            self.followerNumberLabel.text = [[NSNumber numberWithInteger:followerActivities.count] stringValue];
        }
    }];
}

- (PFQuery *)queryForTable {
    
    PFQuery *followingQuery = [PFQuery queryWithClassName:@"Activity"];
    [followingQuery whereKey:@"fromUser" equalTo:[PFUser currentUser]];
    [followingQuery whereKey:@"type" equalTo:@"follow"];
    
    PFQuery *photosFromFollowedUsersQuery = [PFQuery queryWithClassName:@"Photo"];
    [photosFromFollowedUsersQuery whereKey:@"whoTook" matchesKey:@"toUser" inQuery:followingQuery];
    
    PFQuery *photosFromCurrentUserQuery = [PFQuery queryWithClassName:@"Photo"];
    [photosFromCurrentUserQuery whereKey:@"whoTook" equalTo:[PFUser currentUser]];
    
    PFQuery *superQuery = [PFQuery orQueryWithSubqueries:[NSArray arrayWithObjects: photosFromCurrentUserQuery, photosFromFollowedUsersQuery, nil]];
    [superQuery includeKey:@"whoTook"];
    [superQuery orderByDescending:@"createdAt"];
    return superQuery;
}

- (IBAction)logout:(id)sender {
    [PFUser logOut];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDelegate presentLoginControllerAnimated:YES];
    
}


@end
