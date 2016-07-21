//
//  EKAdjustTextViewElement.h
//  Pods
//
//  Created by stonedong on 16/7/21.
//
//

#import <ElementKit/ElementKit.h>


@interface EKAdjustTextViewElement : EKAdjustCellElement
@property (nonatomic, strong) UIFont* font;
+ (instancetype) new NS_UNAVAILABLE;
- (instancetype) init NS_UNAVAILABLE;
- (instancetype) initWithText:(NSString *)text font:(UIFont*)font NS_DESIGNATED_INITIALIZER;
@end
