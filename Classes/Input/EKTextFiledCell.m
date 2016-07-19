//
//  EKTextFiledCell.m
//  Pods
//
//  Created by baidu on 16/4/27.
//
//

#import "EKTextFiledCell.h"
#import "DZProgrameDefines.h"
#import <DZGeometryTools/DZGeometryTools.h>




@implementation EKTextFiledImageView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UIImageView(_imageView);
    _imageSize = (CGSize){20,20};
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectCenter(self.bounds, _imageSize);
}

- (void) setImage:(UIImage *)image
{
    _imageView.image = image;
}

- (UIImage*)image
{
    return _imageView.image;
}
@end

@implementation EKTextFiledCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW(self.contentView, UITextField, _textFiled);
    _leftImageView = [EKTextFiledImageView new];
    _textFiled.leftView = _leftImageView;
    _textFiled.leftViewMode = UITextFieldViewModeAlways;
    _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGFloat height  = CGRectGetHeight(self.contentView.bounds) - 10;
    
    CGRect imageRect = CGRectMake(0, 0, 20+20, CGRectGetHeight(self.contentView.bounds));
    _leftImageView.frame = imageRect;
    CGRect rect = CGRectCenterSubSize(self.contentView.bounds, CGSizeMake(20, 0));
    _textFiled.frame = rect;
    _textFiled.leftView = _leftImageView;
}

@end
