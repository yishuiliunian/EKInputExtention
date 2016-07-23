//
//  EKSwitchItemElement.h
//  Pods
//
//  Created by stonedong on 16/7/23.
//
//

#import <ElementKit/ElementKit.h>


@interface EKSwitchItemElement : EKAdjustCellElement
@property (nonatomic, assign) BOOL on;
@property (nonatomic, strong) void (^ValueChangedBlock)(BOOL on);
@property (nonatomic, strong) NSString* title;
- (instancetype) initWithOn:(BOOL)on;
@end
