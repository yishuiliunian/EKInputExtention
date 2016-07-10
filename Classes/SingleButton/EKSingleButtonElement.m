//
//  EKSingleButtonElement.m
//  Pods
//
//  Created by stonedong on 16/7/10.
//
//

#import <Foundation/Foundation.h>
#import "EKSingleButtonElement.h"
#import "EKSingleButtonCell.h"
@implementation EKSingleButtonElement
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = [EKSingleButtonCell class];
    self.cellHeight = 54;
    return self;
}

- (void) willBeginHandleResponser:(EKSingleButtonCell*)cell
{
    [super willBeginHandleResponser:cell];
    if (_normalImage) {
        [cell.button setBackgroundImage:_normalImage forState:UIControlStateNormal];
    }
    if (_disableImage) {
        [cell.button setBackgroundImage:_disableImage forState:UIControlStateDisabled];
    }
    
    if (_highlightImage) {
        [cell.button setBackgroundImage:_highlightImage forState:UIControlStateHighlighted];
        [cell.button setBackgroundImage:_highlightImage forState:UIControlStateSelected];
    }
    
    [cell.button setTitle:_title forState:UIControlStateNormal];
    if (_titleNormalColor) {
        [cell.button setTitleColor:_titleNormalColor forState:UIControlStateNormal];
    }
}

- (void) didBeginHandleResponser:(EKSingleButtonCell *)cell
{
    [super didBeginHandleResponser:cell];
    [cell.button addTarget:_target action:_selector forControlEvents:UIControlEventTouchUpInside];
}

- (void) willRegsinHandleResponser:(EKSingleButtonCell *)cell
{
    [super willRegsinHandleResponser:cell];
}

- (void) didRegsinHandleResponser:(EKSingleButtonCell *)cell
{
    [super didRegsinHandleResponser:cell];
    [cell.button removeTarget:_target action:_selector forControlEvents:UIControlEventTouchUpInside];
}
@end