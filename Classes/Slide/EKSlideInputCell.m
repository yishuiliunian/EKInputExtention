//
//  EKSlideInputCell.m
//  Pods
//
//  Created by stonedong on 16/7/18.
//
//

#import <Foundation/Foundation.h>
#import "EKSlideInputCell.h"
#import <DZGeometryTools/DZGeometryTools.h>

@implementation EKSlideInputCell
@synthesize slider = _slider;
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW_UILabel(self.contentView, _titleLabel);
    INIT_SUBVIEW(self.contentView, UISlider,_slider);
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    
    CGRect contentRect = CGRectCenterSubSize(self.contentView.bounds, CGSizeMake(50, 20));
    CGRect titleR;
    CGRect sR;
    CGRectDivide(contentRect, &titleR, &sR, 30, CGRectMinYEdge);
    
    _titleLabel.frame = titleR;
    _slider.frame = sR;
}


@end