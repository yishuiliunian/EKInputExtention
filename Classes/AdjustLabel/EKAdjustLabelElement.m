//
//  EKAdjustLabelElement.m
//  Pods
//
//  Created by stonedong on 16/8/8.
//
//

#import <Foundation/Foundation.h>
#import "EKAdjustLabelElement.h"
#import "EKAdjustLabelCell.h"
#import <DZGeometryTools.h>

@interface EKAdjustLabelElement ()
{
    CGRect _imageRect;
    CGRect _titleRect;
    
    CGRect _contentRect;
}
@end
@implementation EKAdjustLabelElement
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = [EKAdjustLabelCell class];
    _xMargin = 15;
    _yMargin = 10;
    _font = [UIFont systemFontOfSize:15];
    _contentRect = CGRectZero;
    return self;
}

- (void) prelayout
{
    
    CGRect contentRect = [UIScreen mainScreen].bounds;
    if (!CGRectEqualToRect(_contentRect, CGRectZero)) {
        contentRect = _contentRect;
    }
    contentRect.size.height = CGFLOAT_MAX;
    contentRect = CGRectCenterSubSize(contentRect, CGSizeMake(2*_xMargin, 2*_yMargin));
    CGSize imageSize = _image.size;
    
    CGFloat space = 10;
    double cellHeight = 0;
    CGFloat textMaxWidth = CGRectGetWidth(contentRect);
    if (!CGSizeEqualToSize(imageSize, CGSizeZero)) {
        CGRectDivide(contentRect, &_imageRect, &_titleRect, imageSize.width, CGRectMinXEdge);
        _titleRect = CGRectShrink(_titleRect, space, CGRectMinXEdge);
        textMaxWidth = _titleRect.size.width;
        _imageRect.size = imageSize;
    } else {
        _titleRect.origin.x = CGRectGetMinX(contentRect);
    }
    
    CGSize size = CGSizeZero;
    if (_font) {
        size =[_text boundingRectWithSize:CGSizeMake(textMaxWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_font} context:nil].size;
    }
    if (size.height + 2*_yMargin > 44) {
        cellHeight = size.height + 2*_yMargin;
    } else {
        cellHeight = 44.f;
    }
    self.cellHeight = cellHeight;
    _titleRect.origin.y= (cellHeight - size.height)/2;
    _titleRect.size.height = size.height;
    _titleRect.size.width = textMaxWidth;
   _imageRect.origin.y = (cellHeight - imageSize.height) /2;
}

- (instancetype) initWithImage:(UIImage *)image text:(NSString *)text
{
    self = [self init];
    if (!self) {
        return self;
    }
    _image = image;
    _text = text;
    [self prelayout];
    return self;
}

- (void) reloadLayoutAndUI
{
    [self prelayout];
    [self reloadUI];
}
- (void) setImage:(UIImage *)image
{
    if (_image != image) {
        _image = image;
        [self reloadLayoutAndUI];
    }
}

- (void) setText:(NSString *)text
{
    if (_text != text) {
        _text = text;
        [self reloadLayoutAndUI];
    }
}

- (void) setFont:(UIFont *)font
{
    if (_font != font) {
        _font = font;
        [self reloadLayoutAndUI];
    }
}

- (void) layoutCell:(EKAdjustLabelCell *)cell
{
    [super layoutCell:cell];
    if (!CGRectEqualToRect(cell.contentView.frame, _contentRect)) {
        _contentRect = cell.contentView.frame;
        [self prelayout];
    }
    cell.adjustLabel.frame = _titleRect;
    cell.adjustImageView.frame = _imageRect;
}

- (void) willBeginHandleResponser:(EKAdjustLabelCell*)cell
{
    [super willBeginHandleResponser:cell];
    cell.adjustImageView.image = self.image;
    cell.adjustLabel.text = self.text;
    cell.adjustLabel.font = self.font;
}

- (void) didBeginHandleResponser:(EKAdjustLabelCell *)cell
{
    [super didBeginHandleResponser:cell];
}

- (void) willRegsinHandleResponser:(EKAdjustLabelCell *)cell
{
    [super willRegsinHandleResponser:cell];
}

- (void) didRegsinHandleResponser:(EKAdjustLabelCell *)cell
{
    [super didRegsinHandleResponser:cell];
}
@end