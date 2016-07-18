//
//  EKSlideInputCell.h
//  Pods
//
//  Created by stonedong on 16/7/18.
//
//
#import <UIKit/UIKit.h>
#import <ElementKit/ElementKit.h>
#import <DZProgrameDefines/DZProgrameDefines.h>

@interface EKSlideInputCell : UITableViewCell
DEFINE_PROPERTY_STRONG(UILabel*, titleLabel);
DEFINE_PROPERTY_STRONG(UISlider*, slider);
@end
