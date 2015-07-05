//
//  FollowButton.h
//  Pillow
//
//  Created by Ross Duris on 10/13/14.
//  Copyright (c) 2014 Ross. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FollowButton;
@protocol FollowButtonDelegate

- (void) followButton:(FollowButton *)button didTapWithSectionIndex:(NSInteger)index;

@end

@interface FollowButton : UIButton

@property (nonatomic, assign)NSInteger sectionIndex;
@property (nonatomic, weak) id <FollowButtonDelegate> delegate;

@end
