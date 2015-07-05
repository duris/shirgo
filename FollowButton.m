//
//  FollowButton.m
//  Pillow
//
//  Created by Ross Duris on 10/13/14.
//  Copyright (c) 2014 Ross. All rights reserved.
//

#import "FollowButton.h"

@implementation FollowButton
/*
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
*/

-(id)initWithCoder:(NSCoder *)aDecoder {
    if (self == [super initWithCoder:aDecoder]) {
        [self addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void) buttonPressed {
    [self.delegate followButton:self didTapWithSectionIndex:self.sectionIndex];
}
    
@end
