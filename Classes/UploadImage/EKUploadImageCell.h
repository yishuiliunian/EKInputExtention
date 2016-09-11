//
//  EKUploadImageCell.h
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//
#import <UIKit/UIKit.h>
#import <ElementKit/ElementKit.h>
#import "DZProgrameDefines.h"
FOUNDATION_EXTERN CGSize EKUploadItemCollectionViewCellSize();
@interface EKUploadImageCell : UITableViewCell
DEFINE_PROPERTY_STRONG(UICollectionView*, collectionView);
@end
