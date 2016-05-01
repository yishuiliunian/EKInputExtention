//
//  EKInputTextViewElement.m
//  Pods
//
//  Created by stonedong on 16/4/30.
//
//

#import <Foundation/Foundation.h>
#import "EKInputTextViewElement.h"
#import "EKInputTextViewCell.h"

@implementation EKInputTextViewElement
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = [EKInputTextViewCell class];
    return self;
}

- (void) willBeginHandleResponser:(EKInputTextViewCell*)cell
{
    [super willBeginHandleResponser:cell];
    cell.textView.placeholder = self.placeHolder;
    cell.textView.text = self.text;
    cell.textView.delegate = self;
}


- (void) didBeginHandleResponser:(EKInputTextViewCell *)cell
{
    [super didBeginHandleResponser:cell];
}

- (void) willRegsinHandleResponser:(EKInputTextViewCell *)cell
{
    [super willRegsinHandleResponser:cell];
    cell.textView.delegate = nil;
}

- (void) textViewDidChange:(UITextView *)textView
{
    _text = textView.text;
}

- (void) didRegsinHandleResponser:(EKInputTextViewCell *)cell
{
    [super didRegsinHandleResponser:cell];
}
@end