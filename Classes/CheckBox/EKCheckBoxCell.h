//
//  EKCheckBoxCell.h
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//
#import <UIKit/UIKit.h>
#import <ElementKit/ElementKit.h>
#import <DZProgrameDefines/DZProgrameDefines.h>
#import <BEMCheckBox/BEMCheckBox.h>
@interface EKCheckBoxCell : UITableViewCell
@property (nonatomic, strong, readonly) BEMCheckBox* checkBox;
//@property (nonatomic, strong, readonly) UILabel* titleLabel;
//@property (nonatomic, strong, readonly) UILabel* detailLabel;
@end
