//
//  EKInputElement.m
//  Pods
//
//  Created by baidu on 16/4/27.
//
//

#import "EKInputElement.h"
#import "NSObject+EventBus.h"
@implementation EKInputElement

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _dataVaild = NO;
    return self;
}

- (void) setDataVaild:(BOOL)dataVaild
{
    _dataVaild = dataVaild;
    if ([self.eventBus respondsToSelector:@selector(inputElement:dataVaildChanged:)]) {
            [self.eventBus performSelector:@selector(inputElement:dataVaildChanged:) withObject:self withObject:@(_dataVaild)];
     }
}

@end
