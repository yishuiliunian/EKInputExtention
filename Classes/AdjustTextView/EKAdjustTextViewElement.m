//
//  EKAdjustTextViewElement.m
//  Pods
//
//  Created by stonedong on 16/7/21.
//
//

#import <Foundation/Foundation.h>
#import "EKAdjustTextViewElement.h"
#import "EKAdjustTextViewCell.h"
#import <DZGeometryTools/DZGeometryTools.h>
@interface EKAdjustTextViewElement ()
{
    NSString* _text;
    CGRect _textR;
}
@end

@implementation EKAdjustTextViewElement

- (instancetype) initWithText:(NSString *)text font:(UIFont*)font
{
    self  = [super init];
    if (!self) {
        return self;
    }
    _viewClass = [EKAdjustTextViewCell class];
    _font = font;
    _text = text;
    [self calLayout];
    return self;
}

- (void) calLayout
{
    CGRect contentRect = [UIScreen mainScreen].bounds;
    contentRect.size.height = CGFLOAT_MAX;
    contentRect = CGRectShrink(contentRect, 20, CGRectMinXEdge);
    contentRect = CGRectShrink(contentRect, 20, CGRectMaxXEdge);
    contentRect = CGRectShrink(contentRect, 10, CGRectMinYEdge);
    
    CGSize size = [_text sizeWithFont:_font constrainedToSize:contentRect.size];
    contentRect.size = size;
    _textR = contentRect;
    self.cellHeight = size.height + 20;
}


- (void) layoutCell:(EKAdjustTextViewCell *)cell
{
    [super layoutCell:cell];
    cell.adjustTextLabel.frame = _textR;
}

- (void) willBeginHandleResponser:(EKAdjustTextViewCell*)cell
{
    [super willBeginHandleResponser:cell];
    cell.adjustTextLabel.font = _font;
    cell.adjustTextLabel.text = _text;
}

- (void) didBeginHandleResponser:(EKAdjustTextViewCell *)cell
{
    [super didBeginHandleResponser:cell];
}

- (void) willRegsinHandleResponser:(EKAdjustTextViewCell *)cell
{
    [super willRegsinHandleResponser:cell];
}

- (void) didRegsinHandleResponser:(EKAdjustTextViewCell *)cell
{
    [super didRegsinHandleResponser:cell];
}
@end