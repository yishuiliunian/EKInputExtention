//
//  EKInputTableElement.h
//  Pods
//
//  Created by baidu on 16/4/27.
//
//

#import <ElementKit/ElementKit.h>
#import "EKInputElement.h"

@interface EKInputTableElement : EKAdjustTableElement <EKInputElementEvents>
/**
 *  加载InputElements
 */
- (void) loadInputElements;
@end
