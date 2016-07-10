//
//  EKSingleButtonCell.m
//  Pods
//
//  Created by stonedong on 16/7/10.
//
//

#import <Foundation/Foundation.h>
#import "EKSingleButtonCell.h"
#import <DZGeometryTools/DZGeometryTools.h>

@implementation EKSingleButtonCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW_UIButton(self.contentView, _button);
    self.backgroundColor = [UIColor clearColor];
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _button.frame = CGRectCenterSubSize(self.bounds, CGSizeMake(30, 10));
}


@end