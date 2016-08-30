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

- (void) dealloc
{
    [_centerImageView removeObserver:self forKeyPath:@"image"];
}
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
    _centerImageView.contentMode = UIViewContentModeScaleAspectFill;
    _centerImageView.layer.masksToBounds = YES;
    [_centerImageView addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    _needsquare = YES;
    _heightWidthRatio = 1.0;
    return self;
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"image"]) {
        [self setNeedsLayout];
    }
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat height = MIN(CGRectGetHeight(self.contentView.frame), CGRectGetWidth(self.contentView.frame));
    height -= 2* _margin;
    
    CGFloat width = height;
    if ( !_needsquare) {
        width = height /_heightWidthRatio ;
    }
    _centerImageView.frame = CGRectCenter(self.contentView.frame, CGSizeMake(width, height));
    
}
@end
