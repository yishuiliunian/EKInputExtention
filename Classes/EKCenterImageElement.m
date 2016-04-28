//
//  EKCenterImageElement.m
//  Pods
//
//  Created by baidu on 16/4/28.
//
//

#import "EKCenterImageElement.h"
#import "EKCenterImageViewCell.h"
@implementation EKCenterImageElement

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = [EKCenterImageViewCell class];
    return self;
}

- (void) willBeginHandleResponser:(EKCenterImageViewCell *)responser
{
    [super willBeginHandleResponser:responser];
    responser.centerImageView.image = self.image;
}

@end
