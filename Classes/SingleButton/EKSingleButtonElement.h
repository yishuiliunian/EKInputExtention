//
//  EKSingleButtonElement.h
//  Pods
//
//  Created by stonedong on 16/7/10.
//
//

#import <ElementKit/ElementKit.h>


@interface EKSingleButtonElementStatus : NSObject
@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, strong)  UIImage* normalImage;
@property (nonatomic, strong) UIImage* disableImage;
@property (nonatomic, strong) UIImage* highlightImage;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) UIColor* titleNormalColor;
@property (nonatomic, assign) BOOL border;
@end


@interface EKSingleButtonElement : EKAdjustCellElement
@property (nonatomic, strong) EKSingleButtonElementStatus* currentStatus;
@end
