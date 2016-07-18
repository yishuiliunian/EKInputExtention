//
//  EKCenterUploadImageElement.h
//  Pods
//
//  Created by stonedong on 16/7/10.
//
//

#import "EKInputElement.h"
@interface EKCenterUploadImageElement : EKInputElement
{
    @protected
    UIImage* _cachedImage;
}
@property (nonatomic, strong) UIImage* placeHodlerImage;
@property (nonatomic, strong, readonly) NSString* url;
- (instancetype) initPlaceHolderImage:(UIImage*)image;

- (void) uploadImage:(UIImage*)image;
- (void) didUploadedImage:(UIImage*)image withURL:(NSString*)url;
@end
