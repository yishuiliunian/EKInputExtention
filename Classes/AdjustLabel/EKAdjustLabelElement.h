//
//  EKAdjustLabelElement.h
//  Pods
//
//  Created by stonedong on 16/8/8.
//
//

#import <ElementKit/ElementKit.h>

#import "EKInputElement.h"
@interface EKAdjustLabelElement : EKInputElement
@property (nonatomic, assign) CGFloat xMargin;
@property (nonatomic, assign) CGFloat yMargin;
@property (nonatomic, strong) UIImage* image;
@property (nonatomic, strong) NSString* text;
@property (nonatomic, strong) UIFont* font;
- (instancetype) initWithImage:(UIImage*)image text:(NSString*)text;
@end
