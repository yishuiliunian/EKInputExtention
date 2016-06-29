//
//  EKInputTextViewElement.h
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//

#import <ElementKit/ElementKit.h>


@interface EKInputTextViewElement : EKAdjustCellElement <UITextViewDelegate>
@property (nonatomic, strong) NSString* text;
@property (nonatomic, strong) NSString* placeHolder;
@property (nonatomic, strong) UIFont* textFont;
@end
