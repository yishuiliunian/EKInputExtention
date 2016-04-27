//
//  EKInputElement.h
//  Pods
//
//  Created by baidu on 16/4/27.
//
//

#import <ElementKit/ElementKit.h>


@class EKInputElement;
@protocol EKInputElementEvents <NSObject>
- (void) inputElement:(EKInputElement*)ele dataVaildChanged:(NSNumber*)vaild;
@end


@interface EKInputElement : EKAdjustCellElement
@property (nonatomic, assign) BOOL dataVaild;
@end
