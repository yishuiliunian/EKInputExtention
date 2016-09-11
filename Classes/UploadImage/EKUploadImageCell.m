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
#import <DZGeometryTools.h>

static CGFloat const EKUploadCollectionCellXSpace = 10;
static CGFloat const EKUploadCollectionCellYSpace = 5;
CGSize EKUploadItemCollectionViewCellSize() {
    CGRect rect = [UIScreen mainScreen].bounds;
    rect = CGRectCenterSubSize(rect, CGSizeMake(30, 0));
    CGFloat height = (rect.size.width - 10) / 3;
    rect.size.width = rect.size.height = height;
    return rect.size ;
}

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
    collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    collectionViewLayout.minimumLineSpacing = 4;
    collectionViewLayout.minimumInteritemSpacing = 4;
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
    return EKUploadItemCollectionViewCellSize();
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect conentRect = CGRectCenterSubSize(self.contentView.bounds, CGSizeMake(30, 10));
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
    return cell;
}

- (void) collectionView:(UICollectionView *)collectionView willDisplayCell:(EKUploadItemCollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.uploadLayout.maxImageCount >= self.uploadLayout.numberOfUploadImage && indexPath.row == self.uploadLayout.numberOfUploadImage) {
        UIImage* image = [UIImage imageNamed:@"btn_opinion_addphoto.png" ];
        cell.imageView.image = image;
    } else {
        [self.uploadLayout loadContentForUploadItemCell:cell atIndex:(int)indexPath.row];
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