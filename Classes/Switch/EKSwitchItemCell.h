//
//  EKSwitchItemCell.h
//  Pods
//
//  Created by stonedong on 16/7/23.
//
//
#import <UIKit/UIKit.h>
#import <ElementKit/ElementKit.h>
#import <DZProgrameDefines/DZProgrameDefines.h>

@protocol EKSwitchItemCellEvents <NSObject>

- (void) EKSwitchItemCellValueChanged:(NSNumber*)on;

@end

@interface EKSwitchItemCell : EKAdjustTableViewCell
DEFINE_PROPERTY_STRONG(UISwitch*, switchView);
@end
