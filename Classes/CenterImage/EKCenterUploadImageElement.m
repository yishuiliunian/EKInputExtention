//
//  EKCenterUploadImageElement.m
//  Pods
//
//  Created by stonedong on 16/7/10.
//
//

#import "EKCenterUploadImageElement.h"
#import "EKCenterImageViewCell.h"
#import "DZProgrameDefines.h"
#import <SVProgressHUD/SVProgressHUD.h>

#import "UIImage+FixAppearance.h"
@interface EKCenterUploadImageElement ()
@end

@implementation EKCenterUploadImageElement

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = [EKCenterImageViewCell class];
    _cellHeight = 140.f;
    _photoTweak = NO;
    _cropMode = RSKImageCropModeSquare;
    _cropRatio = 0.8;
    _needsquare = YES;
    return self;
}

-  (instancetype) initPlaceHolderImage:(UIImage *)image
{
    self = [self init];
    if (!self) {
        return self;
    }
    _placeHodlerImage = image;
    return self;
}



- (void) willBeginHandleResponser:(EKCenterImageViewCell *)cell
{
    [super willBeginHandleResponser:cell];
    cell.needsquare = self.needsquare;
    cell.heightWidthRatio = self.cropRatio;
    if (_cachedImage) {
        cell.centerImageView.image = _cachedImage;
    } else if(_placeHodlerImage){
        cell.centerImageView.image = _placeHodlerImage;
    }
}
- (void) handleSelectedInViewController:(UIViewController *)vc
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    [self takePicture];
}


INIT_DZ_EXTERN_STRING(kDZPICFromLocal, 相册)
INIT_DZ_EXTERN_STRING(kDZPICFromCamera,拍照 )

#pragma mark Image Picker
- (void) takePicture
{
    UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择照片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:kDZPICFromLocal,kDZPICFromCamera, nil];
    [actionSheet showInView:self.hostViewController.view];
}

- (void) actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSString* title = [actionSheet buttonTitleAtIndex:buttonIndex];
    UIImagePickerController* pickerVC = [[UIImagePickerController alloc]init];
    pickerVC.delegate = self;
    if ([title isEqualToString:kDZPICFromCamera]) {
        pickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else if ([title isEqualToString:kDZPICFromLocal]) {
        pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    else {
        return;
    }
    
    [self.hostViewController.navigationController presentViewController:pickerVC animated:YES completion:^{
        
    }];
}


- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (void) uploadImage:(UIImage*)image
{
    NSAssert(NO, @"You must implitation this function to upload image");
}

- (void) didUploadedImage:(UIImage*)image withURL:(NSString*)url
{
    if (!url) {
        return;
    }
    _cachedImage = image;
    _url = url;
    [self setDataVaild:YES];
}
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage* image = info[UIImagePickerControllerOriginalImage];
    image = [image fixAppearance];
    if (self.photoTweak) {
        RSKImageCropViewController *imageCropVC = [[RSKImageCropViewController alloc] initWithImage:image];
        imageCropVC.delegate = self;
        imageCropVC.cropMode = self.cropMode;
        imageCropVC.dataSource =self;
        [picker pushViewController:imageCropVC animated:YES];
    } else {
        [picker dismissViewControllerAnimated:YES completion:nil];
        [self uploadImage:image];
        [[(EKCenterImageViewCell*)self.uiEventPool centerImageView] setImage:image];
    }
}

// Crop image has been canceled.
- (void)imageCropViewControllerDidCancelCrop:(RSKImageCropViewController *)controller
{

    [controller.navigationController dismissViewControllerAnimated:YES completion:^{
        [UIApplication sharedApplication].statusBarHidden = NO;
    }];
    [UIApplication sharedApplication].statusBarHidden = NO;
}

// The original image has been cropped.
- (void)imageCropViewController:(RSKImageCropViewController *)controller
                   didCropImage:(UIImage *)croppedImage
                  usingCropRect:(CGRect)cropRect
{
    _cachedImage = croppedImage;
    [self uploadImage:croppedImage];
    [[(EKCenterImageViewCell*)self.uiEventPool centerImageView] setImage:croppedImage];
    [controller.navigationController dismissViewControllerAnimated:YES completion:^{
        [UIApplication sharedApplication].statusBarHidden = NO;
    }];
    [UIApplication sharedApplication].statusBarHidden = NO;

    
}

// The original image has been cropped. Additionally provides a rotation angle used to produce image.
- (void)imageCropViewController:(RSKImageCropViewController *)controller
                   didCropImage:(UIImage *)croppedImage
                  usingCropRect:(CGRect)cropRect
                  rotationAngle:(CGFloat)rotationAngle
{
    _cachedImage = croppedImage;
    [self uploadImage:croppedImage];
    [[(EKCenterImageViewCell*)self.uiEventPool centerImageView] setImage:croppedImage];
    [controller.navigationController dismissViewControllerAnimated:YES completion:^{
        [UIApplication sharedApplication].statusBarHidden = NO;
    }];
    [UIApplication sharedApplication].statusBarHidden = NO;

}

// The original image will be cropped.
- (void)imageCropViewController:(RSKImageCropViewController *)controller
                  willCropImage:(UIImage *)originalImage
{
    // Use when `applyMaskToCroppedImage` set to YES.
    [SVProgressHUD show];
}

- (CGRect) imageCropViewControllerCustomMaskRect:(RSKImageCropViewController *)controller
{
    CGSize maskSize;
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    width = width - 60;
    CGFloat height = width * self.cropRatio;
    maskSize.width = width;
    maskSize.height = height;
    
    
    CGFloat viewWidth = CGRectGetWidth(controller.view.frame);
    CGFloat viewHeight = CGRectGetHeight(controller.view.frame);
    
    CGRect maskRect = CGRectMake((viewWidth - maskSize.width) * 0.5f,
                                 (viewHeight - maskSize.height) * 0.5f,
                                 maskSize.width,
                                 maskSize.height);
    
    return maskRect;
}
- (UIBezierPath*) imageCropViewControllerCustomMaskPath:(RSKImageCropViewController *)controller
{
    CGRect rect = controller.maskRect;
    return [UIBezierPath bezierPathWithRect:rect];
}

- (CGRect)imageCropViewControllerCustomMovementRect:(RSKImageCropViewController *)controller
{
    return controller.maskRect;
}
@end
