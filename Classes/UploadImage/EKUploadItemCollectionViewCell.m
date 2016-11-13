//
//  EKUploadItemCollectionViewCell.m
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//

#import "EKUploadItemCollectionViewCell.h"

@implementation EKUploadItemCollectionViewCell
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW_UIImageView(self.contentView, _imageView);
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.layer.masksToBounds = YES;
    
    return self;
}



- (void) layoutSubviews
{
    [super layoutSubviews];
    _imageView.frame = self.contentView.bounds;
    
}
@end
