//
//  EKSelectListBridge.m
//  Pods
//
//  Created by stonedong on 16/7/10.
//
//

#import "EKSelectListBridge.h"

@implementation EKSelectListBridge
- (void) sendSelected:(id)model from:(UIViewController *)vc
{
    if ([self.delegate respondsToSelector:@selector(source:selectedModel:)]) {
        [self.delegate source:vc selectedModel:model];
    }
}
@end
