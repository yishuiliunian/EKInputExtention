//
//  EKIMGTextL_RElement.h
//  Pods
//
//  Created by stonedong on 16/6/29.
//
//

#import <ElementKit/ElementKit.h>

typedef void(^HandleAction)(void);

@interface EKIMGTextL_RElement : EKAdjustCellElement
@property (nonatomic, strong) UIImage* image;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* detailText;

@property (nonatomic, strong) HandleAction handleAction;
- (instancetype) initWithTitle:(NSString*)title image:(UIImage*)image;

@end
