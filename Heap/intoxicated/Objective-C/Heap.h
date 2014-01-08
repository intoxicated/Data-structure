//
//  Heap.h
//  Data-structure
//
//  Created by R3alFr3e on 1/7/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAX_HEAP 0
#define MIN_HEAP 1

@interface Heap : NSObject

- (id)init;
- (id)initWithOption:(NSInteger)op;
- (id)initWithItems:(NSArray *)array;

- (void)enqueue:(id)obj;
- (id)dequeue;
- (id)popMin;
- (id)popMax;

- (void)merge:(Heap *)otherHeap;
- (void)print;
- (NSInteger)size;

@end
