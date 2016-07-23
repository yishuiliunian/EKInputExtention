//
//  EKSwitchItemElement.m
//  Pods
//
//  Created by stonedong on 16/7/23.
//
//

#import <Foundation/Foundation.h>
#import "EKSwitchItemElement.h"
#import "EKSwitchItemCell.h"
@interface EKSwitchItemElement () <EKSwitchItemCellEvents>
@end

@implementation EKSwitchItemElement
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = [EKSwitchItemCell class];
    return self;
}

- (instancetype) initWithOn:(BOOL)on
{
    self = [self init];
    if (!self) {
        return self;
    }
    _on = on;
    return self;
}

- (void) willBeginHandleResponser:(EKSwitchItemCell*)cell
{
    [super willBeginHandleResponser:cell];
    cell.switchView.on = self.on;
    cell.textLabel.text = self.title;
}

- (void) didBeginHandleResponser:(EKSwitchItemCell *)cell
{
    [super didBeginHandleResponser:cell];
}

- (void) willRegsinHandleResponser:(EKSwitchItemCell *)cell
{
    [super willRegsinHandleResponser:cell];
}

- (void) didRegsinHandleResponser:(EKSwitchItemCell *)cell
{
    [super didRegsinHandleResponser:cell];
}
- (void) EKSwitchItemCellValueChanged:(NSNumber *)on
{
    self.on = [on boolValue];
    if (self.ValueChangedBlock) {
        self.ValueChangedBlock([on boolValue]);
    }
}
@end