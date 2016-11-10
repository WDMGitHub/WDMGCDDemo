//
//  ViewController.m
//  GCDDemo
//
//  Created by wangdemin on 16/10/13.
//  Copyright © 2016年 Demin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self demo5];
}

/**
 *  同步执行串行队列（主队列）
 */
- (void)demo1 {
    NSLog(@"开始前-----%@",[NSThread currentThread]);
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"开始-----%@",[NSThread currentThread]);
    });
    NSLog(@"结束后-----%@",[NSThread currentThread]);
}

/**
 *  同步执行串行队列（非主队列）
 */
- (void)demo2 {
    dispatch_queue_t queue = dispatch_queue_create("com.demo.serialQueue", DISPATCH_QUEUE_SERIAL);
    NSLog(@"开始前-----%@",[NSThread currentThread]);
    dispatch_sync(queue, ^{
        NSLog(@"开始1-----%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"开始2-----%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"开始3-----%@",[NSThread currentThread]);
    });
    NSLog(@"结束后-----%@",[NSThread currentThread]);
}

/**
 *  异步执行串行队列（主队列）
 */
- (void)demo3 {
    NSLog(@"开始前-----%@",[NSThread currentThread]);
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"开始1-----%@",[NSThread currentThread]);
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"开始2-----%@",[NSThread currentThread]);
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"开始3-----%@",[NSThread currentThread]);
    });
    NSLog(@"结束后-----%@",[NSThread currentThread]);
}

/**
 *  异步执行串行队列（非主队列）
 */
- (void)demo4 {
    dispatch_queue_t queue = dispatch_queue_create("com.demo.serialQueue", DISPATCH_QUEUE_SERIAL);
    NSLog(@"开始前-----%@",[NSThread currentThread]);
    dispatch_async(queue, ^{
        NSLog(@"开始1-----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"开始2-----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"开始3-----%@",[NSThread currentThread]);
    });
    NSLog(@"结束后-----%@",[NSThread currentThread]);
}

/**
 *  同步执行并行队列
 */
- (void)demo5 {
    dispatch_queue_t queue = dispatch_queue_create("com.demo.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"开始前-----%@",[NSThread currentThread]);
    dispatch_sync(queue, ^{
        NSLog(@"开始1-----%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"开始2-----%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"开始3-----%@",[NSThread currentThread]);
    });
    NSLog(@"结束后-----%@",[NSThread currentThread]);
}

/**
 *  异步执行并行队列
 */
- (void)demo6 {
    dispatch_queue_t queue = dispatch_queue_create("com.demo.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"开始前-----%@",[NSThread currentThread]);
    dispatch_async(queue, ^{
        NSLog(@"开始1-----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"开始2-----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"开始3-----%@",[NSThread currentThread]);
    });
    NSLog(@"结束后-----%@",[NSThread currentThread]);
}


@end
