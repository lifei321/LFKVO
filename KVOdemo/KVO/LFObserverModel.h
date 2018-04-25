//
//  LFObserverModel.h
//  KVOdemo
//
//  Created by ShanCheli on 2018/4/25.
//  Copyright © 2018年 ShanCheli. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LFObserverBlock)(id observer, NSString *key, id oldValue, id newValue);

@interface LFObserverModel : NSObject

// 被监听的属性
@property (nonatomic, copy) NSString *key;

// 监听者
@property (nonatomic, strong) id observer;

// 属性变化的回调
@property (nonatomic, copy) LFObserverBlock callback;

- (instancetype)initWithObserver:(id)observer key:(NSString *)key callback:(LFObserverBlock)callback;


@end
