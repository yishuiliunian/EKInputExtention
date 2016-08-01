//
//  EKInputTextViewCell.h
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//
#import <UIKit/UIKit.h>
#import <ElementKit/ElementKit.h>
#import "DZProgrameDefines.h"
#import <SZTextView/SZTextView.h>
@interface EKInputTextViewCell : EKAdjustTableViewCell
@property (nonatomic, strong, readonly) SZTextView* textView;
@property (nonatomic, strong, readonly) UILabel* countLabel;
@end
