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
@implementation EKSingleButtonElementStatus

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    return self;
}
@end

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
    if (self.currentStatus.normalImage) {
        [cell.button setBackgroundImage:_currentStatus.normalImage forState:UIControlStateNormal];
    }
    if (_currentStatus.disableImage) {
        [cell.button setBackgroundImage:_currentStatus.disableImage forState:UIControlStateDisabled];
    }
    
    if (_currentStatus.highlightImage) {
        [cell.button setBackgroundImage:_currentStatus.highlightImage forState:UIControlStateHighlighted];
        [cell.button setBackgroundImage:_currentStatus.highlightImage forState:UIControlStateSelected];
    }
    
    [cell.button setTitle:_currentStatus.title forState:UIControlStateNormal];
    if (_currentStatus.titleNormalColor) {
        [cell.button setTitleColor:_currentStatus.titleNormalColor forState:UIControlStateNormal];
    }
    
    if (_currentStatus.border) {
        cell.button.layer.cornerRadius = 2;
        cell.button.layer.borderColor = [UIColor blueColor].CGColor;
        cell.button.layer.borderWidth = 1;
    }
}

- (void) didBeginHandleResponser:(EKSingleButtonCell *)cell
{
    [super didBeginHandleResponser:cell];
    [cell.button addTarget:_currentStatus.target action:_currentStatus.selector forControlEvents:UIControlEventTouchUpInside];
}

- (void) willRegsinHandleResponser:(EKSingleButtonCell *)cell
{
    [super willRegsinHandleResponser:cell];
}

- (void) didRegsinHandleResponser:(EKSingleButtonCell *)cell
{
    [super didRegsinHandleResponser:cell];
    [cell.button removeTarget:_currentStatus.target action:_currentStatus.selector forControlEvents:UIControlEventTouchUpInside];
}
@end