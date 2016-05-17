//
//  EKUploadImageElement.h
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//

#import <ElementKit/ElementKit.h>


@class EKUploadImageCell;
@class EKUploadItemCollectionViewCell;
@interface EKUploadImageElement : EKAdjustCellElement
@property (nonatomic, assign) int maxImageCount;
- (NSArray*) allUploadedImageURLS;
- (UIImage*) cacheImageForURL:(NSString*)url;
- (int) numberOfUploadImage;
- (void) handleUploadAction:(EKUploadImageCell*)cell;
- (void) loadContentForUploadItemCell:(EKUploadItemCollectionViewCell*)cell atIndex:(int)index;
@end


@interface EKUploadImageElement()
- (void) uploadImage:(UIImage*)image;
- (void) didUploadedImage:(UIImage*)image withURL:(NSString*)url;
@end