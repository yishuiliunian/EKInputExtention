//
//  EKIMGTextL_RElement.h
//  Pods
//
//  Created by stonedong on 16/6/29.
//
//

#import <ElementKit/ElementKit.h>
#import "EKInputElement.h"
typedef void(^HandleAction)(void);

@interface EKIMGTextL_RElement : EKInputElement
@property (nonatomic, strong) UIImage* image;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* detailText;

- (instancetype) initWithTitle:(NSString*)title image:(UIImage*)image;
- (instancetype) initWithTitle:(NSString *)title image:(UIImage *)image detailText:(NSString*)detailText;
@end
