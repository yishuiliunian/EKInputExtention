//
//  EKCenterImageViewCell.h
//  Pods
//
//  Created by baidu on 16/4/28.
//
//

#import <ElementKit/ElementKit.h>

@interface EKCenterImageViewCell : EKAdjustTableViewCell
@property (nonatomic, strong, readonly) UIImageView* centerImageView;
@property (nonatomic, assign) CGFloat margin;
@end
