//
//  NSObject+KVO.h
//  KVOdemo
//
//  Created by ShanCheli on 2018/4/25.
//  Copyright © 2018年 ShanCheli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFObserverModel.h"


@interface NSObject (KVO)

// 添加观察者
- (void)LF_addObserver:(id)observer key:(NSString *)key callback:(LFObserverBlock)callback;

// 移除观察者
- (void)LF_removeObserver:(id)observer key:(NSString *)key;

@end
