//
//  InfiniteScrollview.m
//  scrollViewExample
//
//  Created by moi on 12-11-19.
//  Copyright (c) 2012 moi. All rights reserved.
//

#import "InfiniteScrollview.h"

@implementation InfiniteScrollview
@synthesize normalizedPosition = _normalizedPosition;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {        
        // hide horizontal scroll indicator so our recentering trick is not revealed
        [self setShowsHorizontalScrollIndicator:NO];
        self.backgroundColor = [UIColor clearColor];
        self.contentOffset = CGPointZero;
        //        self.decelerationRate = UIScrollViewDecelerationRateFast;
    }
    return self;
}

#pragma mark -
#pragma mark Layout

// recenter content periodically to achieve impression of infinite scrolling
- (void)calculateNormalizedPosition {
    CGPoint currentOffset = self.contentOffset;
    if (currentOffset.x < 0) currentOffset.x = self.contentSize.width-self.frame.size.width;
    else if (currentOffset.x >= self.contentSize.width - self.frame.size.width) currentOffset.x = 0;
    self.contentOffset = currentOffset;
    _normalizedPosition = 1.0f - currentOffset.x / self.frame.size.width;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self calculateNormalizedPosition];
}

@end

