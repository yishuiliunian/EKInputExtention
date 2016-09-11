//
//  EKTextFiledElement.h
//  Pods
//
//  Created by baidu on 16/4/27.
//
//

#import "EKInputElement.h"

@class EKTextFiledCell;
@interface EKTextFiledElement : EKInputElement <UITextFieldDelegate>
@property (nonatomic, strong, readonly) EKTextFiledCell* activeCell;
@property (nonatomic, strong) NSString* text;
@property (nonatomic, strong) NSString* placeHolder;
@property (nonatomic, strong) UIImage* leftImage;
@property (nonatomic, strong) UIFont* textFont;
- (instancetype) initWithImage:(UIImage*)image placeHolder:(NSString*)placeHolder;
@end
