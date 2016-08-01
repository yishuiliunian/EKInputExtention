//
//  EKInputTextViewElement.h
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//

#import <ElementKit/ElementKit.h>
#import "EKInputElement.h"
@interface EKInputTextViewElement : EKInputElement <UITextViewDelegate>
@property (nonatomic, strong) NSString* text;
@property (nonatomic, strong) NSString* placeHolder;
@property (nonatomic, strong) UIFont* textFont;
@property (nonatomic, assign) NSUInteger maxLimit;
@end
