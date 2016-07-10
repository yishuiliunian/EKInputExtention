//
//  EKSelectListBridge.h
//  Pods
//
//  Created by stonedong on 16/7/10.
//
//

#import <Foundation/Foundation.h>

@protocol EKSelectListBridgeDelegate <NSObject>

- (void) source:(UIViewController*)vc selectedModel:(id)model;

@end

@interface EKSelectListBridge : NSObject
@property (nonatomic, weak) id<EKSelectListBridgeDelegate> delegate;
-  (void) sendSelected:(id)model from:(UIViewController*)vc;
@end
