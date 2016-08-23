//
//  EKUploadItemCollectionViewCell.h
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//

#import <UIKit/UIKit.h>
#import "DZProgrameDefines.h"

@class EKUploadItemCollectionViewCell;
@protocol EKUploadItemCollectionViewCellDelegate <NSObject>

- (void) uploadItemCellOccurDelete:(EKUploadItemCollectionViewCell*)cell;
- (void) uploadItemCellOccurReplace:(EKUploadItemCollectionViewCell *)cell;

@end

@interface EKUploadItemCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong, readonly) UILongPressGestureRecognizer* longPressRecognizer;
@property (nonatomic, weak) id<EKUploadItemCollectionViewCellDelegate> delegate;
DEFINE_PROPERTY_STRONG_UIImageView(imageView);
@end
