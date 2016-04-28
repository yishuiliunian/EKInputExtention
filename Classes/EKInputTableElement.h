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
@property (nonatomic, assign) BOOL dataVaild;
/**
 *  加载InputElements
 */
- (void) loadInputElements;

/**
 *  数据的状态发生改变，子类实现该函数可以接受通知
 */
- (void) dataStatesChanged;
@end
