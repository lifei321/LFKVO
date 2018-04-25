//
//  LFObserverModel.m
//  KVOdemo
//
//  Created by ShanCheli on 2018/4/25.
//  Copyright © 2018年 ShanCheli. All rights reserved.
//

#import "LFObserverModel.h"

@implementation LFObserverModel

- (instancetype)initWithObserver:(id)observer key:(NSString *)key callback:(LFObserverBlock)callback {
    if (self = [super init]) {
        _observer = observer;
        _key = key;
        _callback = callback;
    }
    
    return self;
}

@end
