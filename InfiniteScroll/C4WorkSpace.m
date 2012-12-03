//
//  C4WorkSpace.m
//  InfiniteScroll
//
//  Created by moi on 12-12-03.
//  Copyright (c) 2012 moi. All rights reserved.
//

#import "C4WorkSpace.h"
#import "InfiniteScrollview.h"

@implementation C4WorkSpace {
    C4Image *infiniteImage, *infiniteImage2;
    InfiniteScrollview *scrollView;
}

-(void)setup {
    infiniteImage = [C4Image imageNamed:@"infiniteImage.png"];
    infiniteImage2 = [C4Image imageNamed:@"infiniteImage2.png"];
    infiniteImage2.origin = CGPointMake(infiniteImage.width,0);
    scrollView = [[InfiniteScrollview alloc] initWithFrame:self.canvas.frame];
    [scrollView addSubview:infiniteImage];
    [scrollView addSubview:infiniteImage2];

    CGSize newContentSize = infiniteImage.frame.size;
    newContentSize.width += scrollView.frame.size.width;

    scrollView.contentSize = newContentSize;
    [self.canvas addSubview:scrollView];
}
					
@end
