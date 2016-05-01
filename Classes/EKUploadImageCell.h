//
//  EKUploadImageCell.h
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//
#import <UIKit/UIKit.h>
#import <ElementKit/ElementKit.h>
#import "DZProgramDefines.h"

@interface EKUploadImageCell : UITableViewCell
DEFINE_PROPERTY_STRONG(UICollectionView*, collectionView);
DEFINE_PROPERTY_STRONG_UILabel(countLabel);
@end
