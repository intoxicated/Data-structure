//
//  Heap.m
//  Data-structure
//
//  Created by R3alFr3e on 1/7/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import "Heap.h"

@interface Heap
@property (nonatomic, strong) NSMutableArray * heapArray;
@property (nonatomic, assign) BOOL isFixedSize;

- (void)max_heapify:(NSInteger)index;
- (void)min_heapify:(NSInteger)index;
- (void)swapWith:(NSInteger)index otherIndex:(NSInteger)otherIndex;
- (NSInteger)left:(NSInteger)index;
- (NSInteger)right:(NSInteger)index;
@end

@implementation Heap

@end
