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
#import "MWPhotoBrowser.h"

@interface EKUploadImageElement () <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    NSArray* _uploadedImageUrls;
    NSMutableDictionary* _uploadImageCache;
    BOOL _showingCamera;
    BOOL _needShow;
    UIImagePickerControllerSourceType _needType;
    
    NSString* _willRaplaceURL;
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
    self.cellHeight = 100.f;
    _maxImageCount = 3;
    _showingCamera = NO;
    self.selectionStyle = UITableViewCellSeparatorStyleNone;
    _dataVaild = NO;
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

- (NSArray*) allImages
{
    NSMutableArray* array = [NSMutableArray new];
    for (NSString* url in self.allUploadedImageURLS) {
        UIImage* img = [_uploadImageCache objectForKey:url];
        if (img) {
            [array addObject:img];
        }
    }
    return array;
}

- (int) numberOfUploadImage
{
    return (int)_uploadedImageUrls.count;
}


- (void) uploadItemCellOccurReplace:(EKUploadItemCollectionViewCell *)cell
{
    NSIndexPath* indexPath = [self.activeCell.collectionView indexPathForCell:cell];
    if (indexPath.row < _uploadedImageUrls.count) {
        _willRaplaceURL = _uploadedImageUrls[indexPath.row];
        [self takePicture];
    }
}

- (void) uploadItemCellOccurDelete:(EKUploadItemCollectionViewCell *)cell
{
    NSIndexPath* indexPath = [self.activeCell.collectionView indexPathForCell:cell];
    if (indexPath.row < _uploadedImageUrls.count) {
        NSMutableArray* array = [_uploadedImageUrls mutableCopy];
        [array removeObjectAtIndex:indexPath.row];
        _uploadedImageUrls = array;
        [self.activeCell.collectionView reloadData];
    }
}
- (void) handleUploadAction:(EKUploadImageCell *)cell
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    [self takePicture];
}

- (void) handleDidTapImageAtIndex:(NSInteger)index
{
    NSMutableArray* photos = [NSMutableArray new];
    for (UIImage* image in [self allImages]) {
        
        MWPhoto* photo = [MWPhoto photoWithImage:image];
        [photos addObject:photo];
    }
    MWPhotoBrowser* browser = [[MWPhotoBrowser alloc] initWithPhotos:photos];
    if (index < [self allImages].count) {
        [browser setCurrentPhotoIndex:index];
    }
    [self.hostViewController.navigationController pushViewController:browser animated:YES];

}

- (UIImage*) cacheImageForURL:(NSString *)url
{
    if (!url) {
        return nil;
        
    }
    return _uploadImageCache[url];
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
    UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择照片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:kCYPICFromLocal,kCYPICFromCamera, nil];
    [actionSheet showInView:self.hostViewController.view];
}

- (void) showImagePickerWithType:(UIImagePickerControllerSourceType)type
{
    _needShow = NO;
    _needType = 0;
    _showingCamera = YES;
    UIImagePickerController* pickerVC = [[UIImagePickerController alloc]init];
    pickerVC.delegate = self;
        pickerVC.sourceType = type;
    [self.hostViewController.navigationController presentViewController:pickerVC animated:YES completion:^{
        
    }];
}
- (void) actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSString* title = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:kCYPICFromCamera]) {
        [self showImagePickerWithType:UIImagePickerControllerSourceTypeCamera];
    }
    else if ([title isEqualToString:kCYPICFromLocal]) {
        [self showImagePickerWithType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    else {
        _showingCamera = NO;
        _willRaplaceURL = nil;
        return;
    }
}


- (void) showCamera
{
    if (!_showingCamera) {
        if (self.hostViewController) {
            [self showImagePickerWithType:UIImagePickerControllerSourceTypeCamera];
        } else {
            _needShow = YES;
            _needType = UIImagePickerControllerSourceTypeCamera;
        }
    }
 
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
        _showingCamera = NO;
        _willRaplaceURL = nil;
    }];
    
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
    self.dataVaild = YES;
    _uploadImageCache[url] = image;
    if (_uploadedImageUrls) {
        NSMutableArray* array = [_uploadedImageUrls mutableCopy];
        if ([array containsObject:_willRaplaceURL]) {
            NSInteger index = [array indexOfObject:_willRaplaceURL];
            [array replaceObjectAtIndex:index withObject:url];
            _uploadedImageUrls = array;
        }
    } else {
        _uploadedImageUrls = _uploadImageCache.allKeys;
    }
    _willRaplaceURL = nil;
    [self.activeCell.collectionView reloadData];
}
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage* image = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:^{
        _showingCamera = NO;
    }];
    __weak typeof(self) wSelf = self;
    [self uploadImage:image];
}
- (void) willBeginHandleResponser:(EKUploadImageCell*)cell
{
    [super willBeginHandleResponser:cell];

    [cell.collectionView reloadData];
    if (_needShow) {
        [self showImagePickerWithType:_needType];
        _needShow = NO;
    }
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