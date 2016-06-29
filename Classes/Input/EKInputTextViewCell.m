//
//  EKInputTextViewCell.m
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//

#import <Foundation/Foundation.h>
#import "EKInputTextViewCell.h"
#import "DZGeometryTools.h"

@implementation EKInputTextViewCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW(self.contentView, SZTextView, _textView);
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _textView.frame =  CGRectCenterSubSize(self.contentView.bounds, CGSizeMake(30, 20));
}


@end