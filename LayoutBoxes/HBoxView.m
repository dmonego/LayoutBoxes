//
//  HBoxView.m
//  LayoutBoxes
//
//  Created by Daniel Monego on 12/17/12.
//  Copyright 2012. All rights reserved.
//

#import "HBoxView.h"


@implementation HBoxView

@synthesize gap = _gap;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        currentWidth = 0;
        self.gap = 0;
    }
    return self;
}



- (void)addSubview:(UIView *)view
{
    NSLog(@"Horizontally placing image at %f, %f with dimensions %f wide by %f tall", currentWidth, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
    float gapAdjust = ([self.subviews count] > 0 ? self.gap : 0);
    view.frame = CGRectMake(currentWidth + gapAdjust, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
    currentWidth += view.frame.size.width + gapAdjust;
    [self adjustFrame];
    [super addSubview:view];
}

-(void)adjustFrame
{
    float height = 0;
    for (int x = 0; x < [self.subviews count]; x++) 
    {
        UIView *subview = [self.subviews objectAtIndex:x];
        if(subview.frame.size.height > height)
        {
            height = subview.frame.size.height;
        }
    }
    height = (height > 0 ? height : self.frame.size.height);
    NSLog(@"Setting hbox frame to %f, %f with dimensions %f wide by %f tall", self.frame.origin.x, self.frame.origin.y, currentWidth, height);
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, currentWidth, height);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    [super dealloc];
}

@end
