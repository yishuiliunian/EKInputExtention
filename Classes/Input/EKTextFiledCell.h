//
//  EKTextFiledCell.h
//  Pods
//
//  Created by baidu on 16/4/27.
//
//

#import <ElementKit/ElementKit.h>
#import <UIKit/UIKit.h>

@interface EKTextFiledImageView : UIView
@property (nonatomic, strong) UIImage* image;
@property (nonatomic, strong, readonly) UIImageView* imageView;
@property (nonatomic, assign) CGSize imageSize;
@end

@interface EKTextFiledCell : EKAdjustTableViewCell
@property (nonatomic, strong, readonly) UITextField* textFiled;
@property (nonatomic, strong, readonly) EKTextFiledImageView*  leftImageView;
@end
