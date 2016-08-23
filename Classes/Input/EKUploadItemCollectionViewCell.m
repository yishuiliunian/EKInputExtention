//
//  EKUploadItemCollectionViewCell.m
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//

#import "EKUploadItemCollectionViewCell.h"
#import "QBPopupMenu.h"

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
    
    UILongPressGestureRecognizer* longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    [self.contentView addGestureRecognizer:longPress];
    _longPressRecognizer = longPress;
    return self;
}


- (void) handleLongPress:(UILongPressGestureRecognizer*)r
{
    if (r.state == UIGestureRecognizerStateBegan) {
        NSMutableArray* items = [NSMutableArray new];
        
            QBPopupMenuItem* delitem = [[QBPopupMenuItem alloc] initWithTitle:@"删除" target:self action:@selector(deleteCurrentImage)];
            QBPopupMenuItem* replaceitem = [[QBPopupMenuItem alloc] initWithTitle:@"替换" target:self action:@selector(replaceCurrentImage)];
        [items addObject:delitem];
        [items addObject:replaceitem];
        QBPopupMenu* menu = [[QBPopupMenu alloc] initWithItems:items];
        UIWindow* keywindow = [UIApplication sharedApplication].keyWindow;
        CGPoint point = [r locationInView:keywindow];
        CGRect rect = [self convertRect:self.bounds toView:keywindow];
        CGPoint pointInCell = [r locationInView:self];
        rect.origin.y = point.y - pointInCell.y/2;
        rect.origin.x = point.x;
        rect.size.width = 20;
        [menu showInView:keywindow targetRect:rect animated:YES];
    }
}

- (void) deleteCurrentImage
{
    if ([self.delegate respondsToSelector:@selector(uploadItemCellOccurDelete:)]) {
        [self.delegate uploadItemCellOccurDelete:self];
    }
}

- (void) replaceCurrentImage
{
    if ([self.delegate respondsToSelector:@selector(uploadItemCellOccurReplace:)]) {
        [self.delegate uploadItemCellOccurReplace:self];
    }
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _imageView.frame = self.contentView.bounds;
    
}
@end
