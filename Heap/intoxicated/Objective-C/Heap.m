//
//  Heap.m
//  Data-structure
//
//  Created by R3alFr3e on 1/7/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//
//  Binary Heap implementation

#import "Heap.h"
#import "BinaryTree.h"

@interface Heap ()
@property (nonatomic, strong) NSMutableArray * heapArray;
@property (nonatomic, assign) BOOL isFixedSize;
@property (nonatomic, strong) BinaryTree * tree;

- (void)max_heapify:(NSInteger)index;
- (void)min_heapify:(NSInteger)index;
- (void)swapWith:(NSInteger)index otherIndex:(NSInteger)otherIndex;
- (NSInteger)left:(NSInteger)index;
- (NSInteger)right:(NSInteger)index;

@end

@implementation Heap

- (id)init
{
    
}
- (id)initWithOption:(NSInteger)op
{
    
}
- (id)initWithItems:(NSArray *)array
{
    
}

- (void)enqueue:(id)obj
{
    
}
- (id)dequeue
{
    
}
- (id)popMin
{
    
}
- (id)popMax
{
    
}

- (void)merge:(Heap *)otherHeap
{
    
}
- (void)print
{
    
}
- (NSInteger)size
{
    
}
@end
