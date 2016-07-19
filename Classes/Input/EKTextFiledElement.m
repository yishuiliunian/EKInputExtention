//
//  EKTextFiledElement.m
//  Pods
//
//  Created by baidu on 16/4/27.
//
//

#import "EKTextFiledElement.h"
#import "EKTextFiledCell.h"
@implementation EKTextFiledElement

- (instancetype) init
{
    self =[super init];
    if (!self) {
        return self;
    }
    _viewClass = [EKTextFiledCell class];
    return self;
}
- (instancetype) initWithImage:(UIImage *)image placeHolder:(NSString *)placeHolder
{
    self = [self init];
    if (!self) {
        return self;
    }
    _leftImage = image;
    _placeHolder = placeHolder;
    return self;
}
- (EKTextFiledCell*) activeCell
{
    return (EKTextFiledCell*)self.uiEventPool;
}
- (void) willBeginHandleResponser:(EKTextFiledCell *)responser
{
    [super willBeginHandleResponser:responser];
    [responser.textFiled addTarget:self action:@selector(textContentChanged:) forControlEvents:UIControlEventEditingChanged];
    responser.textFiled.text = _text;
    responser.textFiled.placeholder = _placeHolder;
    responser.textFiled.delegate = self;
    responser.leftImageView.image = self.leftImage;
}

- (void) willRegsinHandleResponser:(EKTextFiledCell *)responser
{
    [super willRegsinHandleResponser:responser];
    [responser.textFiled removeTarget:self action:@selector(textContentChanged:) forControlEvents:UIControlEventEditingChanged];
    responser.textFiled.delegate = self;
}
- (void) didRegsinHandleResponser:(EKTextFiledCell *)responser
{
    [super didRegsinHandleResponser:responser];
}

- (void) textContentChanged:(UITextField*)textFiled
{
    _text = textFiled.text;
    self.dataVaild = YES;
}

@end
