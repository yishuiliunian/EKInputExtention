//
//  EKSpaceElement.m
//  Pods
//
//  Created by baidu on 16/4/28.
//
//

#import "EKSpaceElement.h"

@implementation EKSpaceElement
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _dataVaild = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    return self;
}

- (void) willBeginHandleResponser:(UITableViewCell *)responser
{
    [super willBeginHandleResponser:responser];

    responser.backgroundColor = [UIColor clearColor];
    responser.contentView.backgroundColor = [UIColor clearColor];
}

- (void) willRegsinHandleResponser:(UITableViewCell *)responser
{
    [super willRegsinHandleResponser:responser];
}
@end
