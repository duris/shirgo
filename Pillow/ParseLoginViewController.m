//
//  ParseLoginViewController.m
//  Pillow
//
//  Created by Ross Duris on 10/4/14.
//  Copyright (c) 2014 Ross. All rights reserved.
//

#import "ParseLoginViewController.h"

@interface ParseLoginViewController ()

@end

@implementation ParseLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.logInView.backgroundColor = WHITE_COLOR;
    self.logInView.logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    [self.logInView.facebookButton setTitle:@"Login with Facebook" forState:UIControlStateNormal];
    self.logInView.usernameField.backgroundColor = WHITE_COLOR;
    self.logInView.passwordField.backgroundColor = WHITE_COLOR;
    [self.logInView.usernameField setTextColor:BLACK];
     [self.logInView.passwordField setTextColor:BLACK];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.logInView.facebookButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    
    CGRect frame = self.logInView.logo.frame;
    frame.origin.y = 150;
    self.logInView.logo.frame = frame;
    frame = self.logInView.facebookButton.frame;
    frame.origin.y = 396;
    self.logInView.facebookButton.frame = frame;
}

@end
