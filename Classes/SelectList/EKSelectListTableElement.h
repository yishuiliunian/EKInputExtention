//
//  EKSelectListTableElement.h
//  Pods
//
//  Created by stonedong on 16/7/10.
//
//

#import <ElementKit/ElementKit.h>
#import "EKSelectListBridge.h"
@interface EKSelectListTableElement : EKAdjustTableElement
@property (nonatomic, strong, readonly) EKSelectListBridge* selectBridge;
@end
