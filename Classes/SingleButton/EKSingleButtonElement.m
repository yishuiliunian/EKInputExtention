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

@interface EKSingleButtonElement ()
@property (nonatomic, weak, readonly) EKSingleButtonCell* cell;
@end

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
    self.cellHeight = 54.f;
    _enable = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    return self;
}
- (EKSingleButtonCell*) cell
{
    return (EKSingleButtonCell*)self.uiEventPool;
}

- (void) setCurrentStatus:(EKSingleButtonElementStatus *)currentStatus
{
    if (_currentStatus != currentStatus) {
        [self.cell.button removeTarget:_currentStatus.target action:_currentStatus.selector forControlEvents:UIControlEventTouchUpInside];
        _currentStatus = currentStatus;
        [self reloadUI];
    }
}
- (void) willBeginHandleResponser:(EKSingleButtonCell*)cell
{
    [super willBeginHandleResponser:cell];
    [self.currentStatus.style decorateView:cell.button];
    [cell.button setTitle:self.currentStatus.title forState:UIControlStateNormal];
    cell.button.enabled = _enable;
}

- (void) setEnable:(BOOL)enable
{
    _enable = enable;
    self.cell.button.enabled = _enable;
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