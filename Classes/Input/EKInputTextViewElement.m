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

@interface EKInputTextViewElement () <UITextViewDelegate>
@property (nonatomic, weak, readonly) EKInputTextViewCell* textViewCell;
@end

@implementation EKInputTextViewElement
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = [EKInputTextViewCell class];
    _dataVaild = NO;
    return self;
}

- (EKInputTextViewCell*) textViewCell
{
    return (EKInputTextViewCell*)self.uiEventPool;
}

- (void) willBeginHandleResponser:(EKInputTextViewCell*)cell
{
    [super willBeginHandleResponser:cell];
    cell.textView.placeholder = self.placeHolder;
    cell.textView.text = self.text;
    cell.textView.delegate = self;
    if (_textFont) {
        cell.textView.font = _textFont;
    }
    [self loadTextCount:_text];
}

- (void) didBeginHandleResponser:(UIResponder *)responser
{
    [super didBeginHandleResponser:responser];
    [self loadTextCount:_text];
}
- (void) loadTextCount:(NSString*)text
{
    NSString* textCountStr = [NSString stringWithFormat:@"%d/%d字",text.length, self.maxLimit];
    if (text.length > self.maxLimit) {
        self.textViewCell.countLabel.textColor = [UIColor redColor];
        self.dataVaild = NO;
    } else {
        self.textViewCell.countLabel.textColor = [UIColor lightGrayColor];
        if (text.length) {
            self.dataVaild = YES;
        } else {
            self.dataVaild = NO;
        }
    }
    self.textViewCell.countLabel.text = textCountStr;
}
- (void) textViewDidChange:(UITextView *)textView
{
    _text = textView.text;
    [self loadTextCount:textView.text];
}


- (void) willRegsinHandleResponser:(EKInputTextViewCell *)cell
{
    [super willRegsinHandleResponser:cell];
    cell.textView.delegate = nil;
}

- (void) didRegsinHandleResponser:(EKInputTextViewCell *)cell
{
    [super didRegsinHandleResponser:cell];
}
@end