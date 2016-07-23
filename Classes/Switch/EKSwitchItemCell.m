//
//  EKSwitchItemCell.m
//  Pods
//
//  Created by stonedong on 16/7/23.
//
//

#import <Foundation/Foundation.h>
#import "EKSwitchItemCell.h"
#import <DZGeometryTools/DZGeometryTools.h>

@implementation EKSwitchItemCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW(self.contentView, UISwitch, _switchView);
    [_switchView addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventTouchUpInside];
    return self;
}

- (void) valueChanged:(UISwitch*)switchView
{
    [self.ekActionResponser performSelector:@selector(EKSwitchItemCellValueChanged:) withObject:@(switchView.on)];
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGSize size = _switchView.intrinsicContentSize;
    
    CGRect switchR;
    CGRectDivide(contentRect, &switchR, &contentRect, size.width, CGRectMaxXEdge);
    switchR = CGRectCenter(switchR, size);
    switchR = CGRectOffset(switchR, -30, 0);
    self.switchView.frame = switchR;
    
    [self.contentView bringSubviewToFront:_switchView];
}


@end