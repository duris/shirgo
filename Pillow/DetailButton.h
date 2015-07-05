//
//  DetailButton.h
//  Pillow
//
//  Created by Ross Duris on 11/25/14.
//  Copyright (c) 2014 Ross. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailButton;
@protocol DetailButtonDelegate

- (void) detailButton:(DetailButton *)button didTapWithSectionIndex:(NSInteger)index;

@end

@interface DetailButton : UIButton

@property (nonatomic, assign)NSInteger sectionIndex;
@property (nonatomic, weak) id <DetailButtonDelegate> delegate;

@end
