//
//  EKIMGTextL_RElement.h
//  Pods
//
//  Created by stonedong on 16/6/29.
//
//

#import <ElementKit/ElementKit.h>
#import "EKInputElement.h"
#import "EKIMGTextL_RCell.h"
typedef void(^HandleAction)(void);

@interface EKIMGTextL_RElement : EKInputElement
@property (nonatomic, weak, readonly) EKIMGTextL_RCell* IMGText_Cell;
@property (nonatomic, strong) UIImage* image;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* detailText;
@property (nonatomic, strong) UIFont* titleFont;
@property (nonatomic, strong) UIColor* titleColor;
@property (nonatomic, strong) UIFont* detailFont;

- (instancetype) initWithTitle:(NSString*)title image:(UIImage*)image;
- (instancetype) initWithTitle:(NSString *)title image:(UIImage *)image detailText:(NSString*)detailText;
@end
