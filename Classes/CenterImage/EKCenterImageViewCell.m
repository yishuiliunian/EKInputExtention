//
//  EKCenterImageViewCell.m
//  Pods
//
//  Created by baidu on 16/4/28.
//
//

#import "EKCenterImageViewCell.h"
#import "DZGeometryTools.h"
@implementation EKCenterImageViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    _centerImageView = [UIImageView new];
    _margin = 10;
    self.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_centerImageView];
    _centerImageView.contentMode = UIViewContentModeScaleAspectFit;
    _centerImageView.layer.masksToBounds = YES;
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat height = MIN(CGRectGetHeight(self.contentView.frame), CGRectGetWidth(self.contentView.frame));
    height -= 2* _margin;
    _centerImageView.frame = CGRectCenter(self.contentView.frame, CGSizeMake(height, height));
    
}
@end
