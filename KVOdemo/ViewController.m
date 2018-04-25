//
//  ViewController.m
//  KVOdemo
//
//  Created by ShanCheli on 2018/4/24.
//  Copyright © 2018年 ShanCheli. All rights reserved.
//



/*****************************************个人主页有KVO详解********************************************/

 //https://www.jianshu.com/p/27dd6502805e

/*****************************************个人主页有KVO详解********************************************/

#import "ViewController.h"
#import "NSObject+KVO.h"


@interface ViewController ()

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) UIButton *button1;

@property (nonatomic, strong) UIButton *button2;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"123";

    [self addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    

    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setTitle:@"自动触发KVO" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.button = button;
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    [button1 setBackgroundColor:[UIColor orangeColor]];
    [button1 setTitle:@"手动触发KVO" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(button1DidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    self.button1 = button1;

    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 50)];
    [button2 setBackgroundColor:[UIColor orangeColor]];
    [button2 setTitle:@"手动实现的KVO" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button2DidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    self.button2 = button2;
    
    __weak UIButton *weakButton = self.button2;
    [self LF_addObserver:self key:@"nickName" callback:^(id observer, NSString *key, id oldValue, id newValue) {
        [weakButton setTitle:(NSString *)newValue forState:UIControlStateNormal];
    }];

}


// 自动
- (void)buttonDidClick:(UIButton *)button {
    self.name = @"123";
}


// 手动
- (void)button1DidClick:(UIButton *)button {
    [self willChangeValueForKey:@"name"];
    [self didChangeValueForKey:@"name"];
}

- (void)button2DidClick:(UIButton *)button {
    self.nickName = @"1q1q";
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"keyPath----%@", keyPath);
    NSLog(@"object---%@", object);

    NSLog(@"change----%@", change);

}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"name"];
}
@end
