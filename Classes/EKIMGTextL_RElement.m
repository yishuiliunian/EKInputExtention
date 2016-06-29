//
//  EKIMGTextL_RElement.m
//  Pods
//
//  Created by stonedong on 16/6/29.
//
//

#import <Foundation/Foundation.h>
#import "EKIMGTextL_RElement.h"
#import "EKIMGTextL_RCell.h"
@implementation EKIMGTextL_RElement
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = [EKIMGTextL_RCell class];
    return self;
}

- (void) willBeginHandleResponser:(EKIMGTextL_RCell*)cell
{
    [super willBeginHandleResponser:cell];
}

- (void) didBeginHandleResponser:(EKIMGTextL_RCell *)cell
{
    [super didBeginHandleResponser:cell];
}

- (void) willRegsinHandleResponser:(EKIMGTextL_RCell *)cell
{
    [super willRegsinHandleResponser:cell];
}

- (void) didRegsinHandleResponser:(EKIMGTextL_RCell *)cell
{
    [super didRegsinHandleResponser:cell];
}
@end