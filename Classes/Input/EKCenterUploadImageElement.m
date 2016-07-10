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
    _cellHeight = 140;
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
    if (_cachedImage) {
        cell.centerImageView.image = _cachedImage;
    }
    if (_placeHodlerImage) {
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
    [picker dismissViewControllerAnimated:YES completion:nil];
    __weak typeof(self) wSelf = self;
    [self uploadImage:image];
    [[(EKCenterImageViewCell*)self.uiEventPool centerImageView] setImage:image];
}
@end
