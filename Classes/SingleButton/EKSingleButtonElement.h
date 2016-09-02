//
//  EKSingleButtonElement.h
//  Pods
//
//  Created by stonedong on 16/7/10.
//
//

#import <ElementKit/ElementKit.h>
#import <StyleSheet/StyleSheet.h>

@interface EKSingleButtonElementStatus : NSObject
@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, strong) DZButtonStyle* style;
@property (nonatomic, strong) NSString* title;

@end


@interface EKSingleButtonElement : EKAdjustCellElement
@property (nonatomic, strong) EKSingleButtonElementStatus* currentStatus;
@property (nonatomic, assign) BOOL enable;
@end
