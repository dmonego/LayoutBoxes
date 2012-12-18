//
//  VBoxView.m
//  LayoutBoxes
//
//  Created by Daniel Monego on 12/17/12.
//  Copyright 2012 CDM. All rights reserved.
//

#import "VBoxView.h"


@implementation VBoxView

@synthesize gap = _gap;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        currentHeight = 0;
    }
    return self;
}


-(void)addSubview:(UIView *)view
{
    NSLog(@"Vertically placing image at %f, %f with dimensions %f wide by %f tall", view.frame.origin.x, currentHeight, view.frame.size.width, view.frame.size.height);
    float gapAdjust = ([self.subviews count] > 0 ? self.gap : 0);
    view.frame = CGRectMake(view.frame.origin.x, currentHeight + gapAdjust, view.frame.size.width, view.frame.size.height);
    currentHeight += view.frame.size.height + gapAdjust;
    [self adjustFrame];
    [super addSubview:view];
}

-(void)adjustFrame
{
    float width = 0;
    for (int x = 0; x < [self.subviews count]; x++) 
    {
        UIView *subview = [self.subviews objectAtIndex:x];
        if(subview.frame.size.width > width)
        {
            width = subview.frame.size.width;
        }
    }
    NSLog(@"Setting VBox frame to %f, %f with dimensions %f wide by %f tall", self.frame.origin.x, self.frame.origin.y, width, currentHeight);
    width = (width > 0 ? width : self.frame.size.width);
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, currentHeight);
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
