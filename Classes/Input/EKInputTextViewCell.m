//
//  EKInputTextViewCell.m
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//

#import <Foundation/Foundation.h>
#import "EKInputTextViewCell.h"
#import "DZGeometryTools.h"

@implementation EKInputTextViewCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW(self.contentView, SZTextView, _textView);
    INIT_SUBVIEW_UILabel(self.contentView, _countLabel);
    _countLabel.font = [UIFont systemFontOfSize:12];
    _countLabel.textColor = [UIColor lightGrayColor];
    _countLabel.textAlignment = NSTextAlignmentRight;
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect contentRect = CGRectCenterSubSize(self.contentView.bounds, CGSizeMake(30, 20));
    CGRect textR;
    CGRect countR;
    
    CGRectDivide(contentRect, &countR, &textR, 20, CGRectMaxYEdge);
    _textView.frame =  textR;
    _countLabel.frame = countR;
}


@end