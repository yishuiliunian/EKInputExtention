//
//  EKCheckBoxCell.m
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//

#import <Foundation/Foundation.h>
#import "EKCheckBoxCell.h"
#import "DZGeometryTools.h"

@implementation EKCheckBoxCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }

    INIT_SUBVIEW(self.contentView, BEMCheckBox, _checkBox);
    INIT_SUBVIEW_UILabel(self.contentView, _titleLabel);
    INIT_SUBVIEW_UILabel(self.contentView, _detailLabel);
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    contentRect = CGRectCenterSubSize(contentRect, CGSizeMake(30, 20));
    
    CGSize imageSize = CGSizeMake(20, 20);
    
    CGRect boxRect;
    CGRectDivide(contentRect, &boxRect, &contentRect, imageSize.width, CGRectMinXEdge);
    
    boxRect = CGRectCenter(boxRect, imageSize);
    contentRect = CGRectShrink(contentRect, 10, CGRectMinXEdge);
    
    CGRect rects[2];
    CGRectVerticalSplit(contentRect, &rects, 2, 4);
    
    _checkBox.frame = boxRect;
    _titleLabel.frame = rects[0];
    _detailLabel.frame = rects[1];
    
    
}


@end