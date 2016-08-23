//
//  EKUploadImageElement.h
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//

#import <ElementKit/ElementKit.h>
#import "EKUploadItemCollectionViewCell.h"
#import "EKInputElement.h"
@class EKUploadImageCell;
@class EKUploadItemCollectionViewCell;
@interface EKUploadImageElement :EKInputElement <EKUploadItemCollectionViewCellDelegate>
@property (nonatomic, assign) int maxImageCount;
- (NSArray*) allUploadedImageURLS;
- (UIImage*) cacheImageForURL:(NSString*)url;
- (int) numberOfUploadImage;
- (void) handleUploadAction:(EKUploadImageCell*)cell;
- (void) handleDidTapImageAtIndex:(NSInteger)index;
- (void) loadContentForUploadItemCell:(EKUploadItemCollectionViewCell*)cell atIndex:(int)index;
- (void) showCamera;
@end


@interface EKUploadImageElement()
- (void) uploadImage:(UIImage*)image;
- (void) didUploadedImage:(UIImage*)image withURL:(NSString*)url;
@end