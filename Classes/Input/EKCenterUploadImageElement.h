//
//  EKCenterUploadImageElement.h
//  Pods
//
//  Created by stonedong on 16/7/10.
//
//

#import "EKInputElement.h"
#import <RSKImageCropper/RSKImageCropper.h>
@interface EKCenterUploadImageElement : EKInputElement
{
    @protected
    UIImage* _cachedImage;
}
@property (nonatomic, strong, readonly) UIImage* cachedImage;
@property (nonatomic, strong) UIImage* placeHodlerImage;
@property (nonatomic, strong, readonly) NSString* url;
@property (nonatomic, assign) BOOL photoTweak;
@property (nonatomic, assign) RSKImageCropMode cropMode;
@property (nonatomic, assign) BOOL needsquare;
/**
 *  裁剪的宽高比，限定输入为0.5~2.0,只有当cropModel为Custom的时候生效
 */
@property (nonatomic, assign) CGFloat cropRatio;
- (instancetype) initPlaceHolderImage:(UIImage*)image;

- (void) uploadImage:(UIImage*)image;
- (void) didUploadedImage:(UIImage*)image withURL:(NSString*)url;
@end
