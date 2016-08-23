//
//  EKUploadImageCell.m
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//

#import <Foundation/Foundation.h>
#import "EKUploadImageCell.h"
#import "DZGeometryTools.h"
#import "EKUploadItemCollectionViewCell.h"
#import "EKUploadImageElement.h"

@interface EKUploadImageCell () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong, readonly) EKUploadImageElement* uploadLayout;

@end

@implementation EKUploadImageCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    UICollectionViewFlowLayout* collectionViewLayout = [UICollectionViewFlowLayout new];
    collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectLoadViewFrame.size.height, 40) collectionViewLayout:collectionViewLayout];
    [self.contentView addSubview:_collectionView];
    _collectionView.dataSource = self;
    _collectionView.delegate =self;
    [_collectionView registerClass:[EKUploadItemCollectionViewCell class] forCellWithReuseIdentifier:@"x"];
    _collectionView.backgroundColor = [UIColor clearColor];
    
    return self;
}
- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = CGRectGetHeight(collectionView.frame) - 10;
    return CGSizeMake(height, height);
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect conentRect = CGRectCenterSubSize(self.contentView.bounds, CGSizeMake(40, 10));
    _collectionView.frame = conentRect;
}

- (EKUploadImageElement*) uploadLayout
{
    if ([self.attachedElement isKindOfClass:[EKUploadImageElement class]]) {
        return (EKUploadImageElement*)self.attachedElement;
    }
    return nil;
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.uploadLayout.maxImageCount <= self.uploadLayout.numberOfUploadImage) {
        return self.uploadLayout.maxImageCount;
    } else {
        return self.uploadLayout.numberOfUploadImage + 1;
    }
}

- (UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EKUploadItemCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"x" forIndexPath:indexPath];
    cell.delegate = self.attachedElement;
    return cell;
}

- (void) collectionView:(UICollectionView *)collectionView willDisplayCell:(EKUploadItemCollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.uploadLayout.maxImageCount >= self.uploadLayout.numberOfUploadImage && indexPath.row == self.uploadLayout.numberOfUploadImage) {
        UIImage* image = [UIImage imageNamed:@"btn_opinion_addphoto.png" ];
        cell.imageView.image = image;
        cell.longPressRecognizer.enabled = NO;
    } else {
        [self.uploadLayout loadContentForUploadItemCell:cell atIndex:(int)indexPath.row];
        cell.longPressRecognizer.enabled = YES;
    }
}


- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.uploadLayout.maxImageCount >= self.uploadLayout.numberOfUploadImage && indexPath.row == self.uploadLayout.numberOfUploadImage) {
        [self.uploadLayout handleUploadAction:self];
    } else {
        [self.uploadLayout handleDidTapImageAtIndex:indexPath.row];
    }
}



@end