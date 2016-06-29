//
//  EKLineViewElement.m
//  Pods
//
//  Created by stonedong on 16/6/29.
//
//

#import <Foundation/Foundation.h>
#import "EKLineViewElement.h"
#import "EKLineViewCell.h"
@implementation EKLineViewElement
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = [EKLineViewCell class];
    self.cellHeight = 1;
    _lineColor = [UIColor grayColor];
    return self;
}

- (CGFloat) cellHeight
{
    return _cellHeight;
}
- (void) willBeginHandleResponser:(EKLineViewCell*)cell
{
    [super willBeginHandleResponser:cell];
    cell.backgroundColor = _lineColor;
}

- (void) didBeginHandleResponser:(EKLineViewCell *)cell
{
    [super didBeginHandleResponser:cell];
}

- (void) willRegsinHandleResponser:(EKLineViewCell *)cell
{
    [super willRegsinHandleResponser:cell];
}

- (void) didRegsinHandleResponser:(EKLineViewCell *)cell
{
    [super didRegsinHandleResponser:cell];
}
@end