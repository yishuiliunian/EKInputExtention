//
//  EKSelectListTableElement.m
//  Pods
//
//  Created by stonedong on 16/7/10.
//
//

#import "EKSelectListTableElement.h"
#import "EKSelectListItemElement.h"

@interface EKSelectListTableElement () <EKSelectListItemElementEvents>

@end

@implementation EKSelectListTableElement
@synthesize selectBridge = _selectBridge;
- (EKSelectListBridge*) selectBridge
{
    if (!_selectBridge) {
        _selectBridge = [EKSelectListBridge new];
    }
    return _selectBridge;
}

- (void) willBeginHandleResponser:(UIResponder *)responser
{
    [super willBeginHandleResponser:responser];
    [self.eventBus addHandler:self priority:1 port:@selector(EKSelectListItemElementDidSelected:)];
}

- (void) EKSelectListItemElementDidSelected:(EKSelectListItemElement *)ele
{
    [self.selectBridge sendSelected:ele.model from:self.env];
}
@end
