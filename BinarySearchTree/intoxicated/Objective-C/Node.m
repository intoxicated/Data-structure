//
//  Node.m
//  Data-structure
//
//  Created by R3alFr3e on 1/4/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import "Node.h"

@implementation Node

- (id)initWithValue:(NSInteger)value
{
    if(self = [super init])
    {
        self.value = value;
        self.height = 0;
        self.count = 1;
        
        self.rightChild = nil;
        self.leftChild = nil;
    }
    return self;
}

- (BOOL)hasOneChild
{
    return ((self.rightChild != nil && self.leftChild == nil) ||
            (self.rightChild == nil && self.leftChild != nil)) ? YES : NO;
}
- (BOOL)hasTwoChildren
{
    return (self.rightChild != nil && self.leftChild != nil) ? YES : NO;
}

- (BOOL)isLeaf
{
    return (self.rightChild == nil && self.leftChild == nil) ? YES : NO;
}

- (void)swapDataWith:(Node *)otherNode
{
    Node * temp = [[Node alloc] init];
    
    temp.value = otherNode.value;
    temp.height = otherNode.height;
    temp.count = otherNode.count;
    
    otherNode.value = self.value;
    otherNode.height = self.height;
    otherNode.count = self.count;
    
    self.value = temp.value;
    self.height = temp.height;
    self.count = temp.count;
    
    temp = nil;
}

@end
