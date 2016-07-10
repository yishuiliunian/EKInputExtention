//
//  EKSelectListItemElement.m
//  Pods
//
//  Created by stonedong on 16/7/10.
//
//

#import "EKSelectListItemElement.h"

@implementation EKSelectListItemElement

- (void) handleSelectedInViewController:(UIViewController *)vc
{
    [self.eventBus performSelector:@selector(EKSelectListItemElementDidSelected:) withObject:self];
}
@end
