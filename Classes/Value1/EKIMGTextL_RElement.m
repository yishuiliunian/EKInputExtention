//
//  EKIMGTextL_RElement.m
//  Pods
//
//  Created by stonedong on 16/6/29.
//
//

#import <Foundation/Foundation.h>
#import "EKIMGTextL_RElement.h"
#import "EKIMGTextL_RCell.h"
@implementation EKIMGTextL_RElement
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = [EKIMGTextL_RCell class];
    return self;
}

- (instancetype) initWithTitle:(NSString*)title image:(UIImage*)image
{
    self = [self init];
    if (!self) {
        return self;
    }
    _title = title;
    _image = image;
    return self;
}

- (void) willBeginHandleResponser:(EKIMGTextL_RCell*)cell
{
    [super willBeginHandleResponser:cell];
    cell.textLabel.text = _title;
    cell.imageView.image = _image;
    cell.detailTextLabel.text = _detailText;

}

- (void) didBeginHandleResponser:(EKIMGTextL_RCell *)cell
{
    [super didBeginHandleResponser:cell];
}

- (void) willRegsinHandleResponser:(EKIMGTextL_RCell *)cell
{
    [super willRegsinHandleResponser:cell];
}

- (void) didRegsinHandleResponser:(EKIMGTextL_RCell *)cell
{
    [super didRegsinHandleResponser:cell];
}

- (void) handleSelectedInViewController:(UIViewController *)vc
{
    if (self.handleAction) {
        self.handleAction();
    }
}
@end