//
//  EKCheckBoxElement.h
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//

#import <ElementKit/ElementKit.h>

@class EKCheckBoxElement;
@protocol EKCheckBoxElementEvents <NSObject>

- (void) ek_checkBoxElementValueChanged:(EKCheckBoxElement*)ele;

@end

@interface EKCheckBoxElement : EKAdjustCellElement
@property (nonatomic, assign) BOOL opened;
@end
