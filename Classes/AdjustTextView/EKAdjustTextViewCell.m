//
//  EKAdjustTextViewCell.m
//  Pods
//
//  Created by stonedong on 16/7/21.
//
//

#import <Foundation/Foundation.h>
#import "EKAdjustTextViewCell.h"
#import <DZGeometryTools/DZGeometryTools.h>

@implementation EKAdjustTextViewCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW(self.contentView, UILabel, _adjustTextLabel);
    _adjustTextLabel.numberOfLines = 0;
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
}


@end