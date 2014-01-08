//
//  Queue.h
//  Data-structure
//
//  Created by R3alFr3e on 1/6/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject

- (id)init;
- (id)initWithSize:(NSInteger)size;
- (id)initWithQueue:(Queue *)otherQueue;

- (void)enqueue:(id)obj;
- (id)dequeue;

- (id)firstObject;
- (id)lastObject;

- (void)swap:(Queue *)otherQueue;
- (void)prepend:(Queue *)otherQueue;
- (void)append:(Queue *)otherQueue;

- (NSUInteger)size;
- (BOOL)isEmpty;

@end
