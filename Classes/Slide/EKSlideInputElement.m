//
//  EKSlideInputElement.m
//  Pods
//
//  Created by stonedong on 16/7/18.
//
//

#import <Foundation/Foundation.h>
#import "EKSlideInputElement.h"
#import "EKSlideInputCell.h"

@interface EKSlideInputElement ()
@property (nonatomic, weak, readonly) EKSlideInputCell* cell;
@end

@implementation EKSlideInputElement
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = [EKSlideInputCell class];
    self.cellHeight = 80;
    return self;
}
- (EKSlideInputCell*) cell
{
    return (EKSlideInputCell*)self.uiEventPool;
}

- (void) willBeginHandleResponser:(EKSlideInputCell*)cell
{
    [super willBeginHandleResponser:cell];
    cell.slider.value = self.count / (float)50;
    if (self.count) {
        cell.titleLabel.text = [NSString stringWithFormat:@"已经选择人数%d", self.count];
    } else {
        cell.titleLabel.text = @"拖动已选择";
    }
    [cell.slider removeTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [cell.slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
}
- (void) valueChanged:(UISlider*)slider
{
    self.count = slider.value * 50;
    if (self.count) {
       self.cell.titleLabel.text = [NSString stringWithFormat:@"已经选择人数 %d", self.count];
    } else {
        self.cell.titleLabel.text = @"拖动以选择";
    }
}
- (void) setCount:(int)count
{
    _count = count;
    if (count) {
        [self setDataVaild:YES];
    }
}

- (void) didBeginHandleResponser:(EKSlideInputCell *)cell
{
    [super didBeginHandleResponser:cell];
}

- (void) willRegsinHandleResponser:(EKSlideInputCell *)cell
{
    [super willRegsinHandleResponser:cell];
}

- (void) didRegsinHandleResponser:(EKSlideInputCell *)cell
{
    [super didRegsinHandleResponser:cell];
}
@end