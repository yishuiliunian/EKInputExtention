//
//  EKUploadImageElement.m
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//

#import <Foundation/Foundation.h>
#import "EKUploadImageElement.h"
#import "EKUploadImageCell.h"
#import "EKUploadItemCollectionViewCell.h"

@interface EKUploadImageElement () <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    NSArray* _uploadedImageUrls;
    NSMutableDictionary* _uploadImageCache;
}
@property (nonatomic, weak, readonly) EKUploadImageCell* activeCell;
@end

@implementation EKUploadImageElement
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = [EKUploadImageCell class];
    _uploadImageCache = [NSMutableDictionary new];
    self.cellHeight = 100;
    return self;
}
- (EKUploadImageCell*) activeCell
{
    return (EKUploadImageCell*)self.uiEventPool;
}

- (NSArray*) allUploadedImageURLS
{
    return [_uploadedImageUrls copy];
}

- (int) numberOfUploadImage
{
    return (int)_uploadedImageUrls.count;
}

- (void) handleUploadAction:(EKUploadImageCell *)cell
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    [self takePicture];
}

- (void) loadContentForUploadItemCell:(EKUploadItemCollectionViewCell*)cell atIndex:(int)index
{
    cell.imageView.image = _uploadImageCache[_uploadedImageUrls[index]];
}

INIT_DZ_EXTERN_STRING(kCYPICFromLocal, 相册)
INIT_DZ_EXTERN_STRING(kCYPICFromCamera,拍照 )

#pragma mark Image Picker
- (void) takePicture
{
    if (self.numberOfUploadImage>=5) {
//        MUAlertShowSuccess(@"最多只能上传5张照片");
        return;
    }
    UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择照片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:kCYPICFromLocal,kCYPICFromCamera, nil];
    [actionSheet showInView:self.hostViewController.view];
}

- (void) actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSString* title = [actionSheet buttonTitleAtIndex:buttonIndex];
    UIImagePickerController* pickerVC = [[UIImagePickerController alloc]init];
    pickerVC.delegate = self;
    if ([title isEqualToString:kCYPICFromCamera]) {
        pickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else if ([title isEqualToString:kCYPICFromLocal]) {
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
    [self didUploadedImage:image withURL:@"x"];
}

- (void) didUploadedImage:(UIImage*)image withURL:(NSString*)url
{
    if (!url) {
        return;
    }
    _uploadImageCache[url] = image;
    _uploadedImageUrls = _uploadImageCache.allKeys;
    [self.activeCell.collectionView reloadData];
}
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage* image = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    __weak typeof(self) wSelf = self;
    [self uploadImage:image];
}
- (void) willBeginHandleResponser:(EKUploadImageCell*)cell
{
    [super willBeginHandleResponser:cell];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    [cell.collectionView reloadData];
    cell.countLabel.text = [NSString stringWithFormat:@"已上传%d张", self.numberOfUploadImage];
}

- (void) didBeginHandleResponser:(EKUploadImageCell *)cell
{
    [super didBeginHandleResponser:cell];
}

- (void) willRegsinHandleResponser:(EKUploadImageCell *)cell
{
    [super willRegsinHandleResponser:cell];
}

- (void) didRegsinHandleResponser:(EKUploadImageCell *)cell
{
    [super didRegsinHandleResponser:cell];
}
@end