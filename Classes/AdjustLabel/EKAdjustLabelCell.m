//
//  EKAdjustLabelCell.m
//  Pods
//
//  Created by stonedong on 16/8/8.
//
//

#import <Foundation/Foundation.h>
#import "EKAdjustLabelCell.h"
#import <DZGeometryTools/DZGeometryTools.h>

@implementation EKAdjustLabelCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    
    INIT_SUBVIEW(self.contentView, UIImageView, _adjustImageView);
    INIT_SUBVIEW(self.contentView, UILabel, _adjustLabel);
    _adjustLabel.numberOfLines = 0;
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
}


@end