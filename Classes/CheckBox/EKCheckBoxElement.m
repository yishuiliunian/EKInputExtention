//
//  EKCheckBoxElement.m
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//

#import <Foundation/Foundation.h>
#import "EKCheckBoxElement.h"
#import "EKCheckBoxCell.h"

@interface EKCheckBoxElement () <BEMCheckBoxDelegate>

@end

@implementation EKCheckBoxElement
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = [EKCheckBoxCell class];
    return self;
}

- (void) didTapCheckBox:(BEMCheckBox *)checkBox
{
    _opened = checkBox.on;
    if ([self.eventBus respondsToSelector:@selector(ek_checkBoxElementValueChanged:)]) {
        [self.eventBus ek_checkBoxElementValueChanged:self];
    }
}

- (void) willBeginHandleResponser:(EKCheckBoxCell*)cell
{
    [super willBeginHandleResponser:cell];
    cell.checkBox.delegate = self;
    cell.checkBox.on = _opened;

}

- (void) didBeginHandleResponser:(EKCheckBoxCell *)cell
{
    [super didBeginHandleResponser:cell];
}

- (void) willRegsinHandleResponser:(EKCheckBoxCell *)cell
{
    [super willRegsinHandleResponser:cell];
}

- (void) didRegsinHandleResponser:(EKCheckBoxCell *)cell
{
    [super didRegsinHandleResponser:cell];
}
@end