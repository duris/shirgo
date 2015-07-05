//
//  DetailButton.m
//  Pillow
//
//  Created by Ross Duris on 11/25/14.
//  Copyright (c) 2014 Ross. All rights reserved.
//

#import "DetailButton.h"

@implementation DetailButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithCoder:(NSCoder *)aDecoder {
    if (self == [super initWithCoder:aDecoder]) {
        [self addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void) buttonPressed {
    [self.delegate detailButton:self didTapWithSectionIndex:self.sectionIndex];
}

@end
