//
//  EKInputTableElement.m
//  Pods
//
//  Created by baidu on 16/4/27.
//
//

#import "EKInputTableElement.h"
#import "EKInputTableViewController.h"
#import "NSObject+EventBus.h"
@implementation EKInputTableElement

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _dataVaild = NO;
    return self;
}


- (void) loadInputElements
{
    
}

- (void) inputElement:(EKInputElement *)ele dataVaildChanged:(NSNumber *)vaild
{
    __block BOOL dataVaild = YES;
    [_dataController map:^(id e) {
        if ([e isKindOfClass:[EKInputElement class]]) {
            EKInputElement* ele = (EKInputElement*)e;
            dataVaild =  dataVaild && ele.dataVaild;
        }
    }];
    self.dataVaild = dataVaild;
}

- (void) setDataVaild:(BOOL)dataVaild
{
    if (_dataVaild != dataVaild) {
        _dataVaild = dataVaild;
        [self dataStatesChanged];
    }
}

- (void) dataStatesChanged
{
    
}

- (void) reloadData
{
    [self loadInputElements];
    [self.tableView reloadData];
}

- (void) willBeginHandleResponser:(UIResponder *)responser
{
    [super willBeginHandleResponser:responser];
    [self.eventBus addHandler:self priority:1 port:@selector(inputElement:dataVaildChanged:)];
}

- (void) didRegsinHandleResponser:(UIResponder *)responser
{
    [super didRegsinHandleResponser:responser];
    [self.eventBus removeHandler:self prot:@selector(inputElement:dataVaildChanged:)];
}
@end
