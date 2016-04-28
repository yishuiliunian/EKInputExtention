//
//  EKTextFiledCell.m
//  Pods
//
//  Created by baidu on 16/4/27.
//
//

#import "EKTextFiledCell.h"
#import "DZProgramDefines.h"
@implementation EKTextFiledCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW(self.contentView, UITextField, _textFiled);
    _leftImageView = [UIImageView new];
    _textFiled.leftView = _leftImageView;
    _textFiled.leftViewMode = UITextFieldViewModeAlways;
    _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGFloat height  = CGRectGetHeight(self.contentView.bounds) - 10;
    _leftImageView.frame = CGRectMake(0, 0, height + 20, height);
    _textFiled.frame = self.contentView.bounds;
    _textFiled.leftView = _leftImageView;
}

@end
