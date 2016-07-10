//
//  EKSelectListItemElement.h
//  Pods
//
//  Created by stonedong on 16/7/10.
//
//

#import <ElementKit/ElementKit.h>


@class EKSelectListItemElement;
@protocol EKSelectListItemElementEvents <NSObject>

- (void) EKSelectListItemElementDidSelected:(EKSelectListItemElement*)ele;

@end

@interface EKSelectListItemElement : EKAdjustCellElement
@property (nonatomic, strong, readonly) id model;
@end
