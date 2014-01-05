//
//  BinaryTree.m
//  Data-structure
//
//  Created by R3alFr3e on 1/4/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import "BinarySearchTree.h"
#import "Node.h"

@interface BinarySearchTree ()

- (Node *)insert:(Node *)node withValue:(NSInteger)value;



- (NSInteger)getHeight:(Node *)root;
- (NSInteger)getCount:(Node *)root;
- (NSInteger)getMaxDepth:(Node *)root;

@end

@implementation BinarySearchTree

- (id)init
{
    if(self = [super init])
    {
        self.nodeCount = 0;
    }
    return self;
}

#pragma mark - modification methods

- (void)insertNode:(NSInteger)value {
    [self insert:self.root withValue:value];
}

- (Node *)insert:(Node *)node withValue:(NSInteger)value
{
    if(node == nil) //current node is empty
        node = [[Node alloc] initWithValue:value];
    else if(value > node.value) //greater than current node, traverse right
        [self insert:node.rightChild withValue:value];
    else if(value < node.value)
        [self insert:node.leftChild withValue:value];
    else
        ;//warn same value
    
    //update tree information
    node.count = [self getCount:node];
    node.maxDepth = [self getMaxDepth:node];
    node.height = [self getHeight:node];
}

#pragma mark - traversal methods

#pragma mark - misc methods

#pragma mark - tree information

- (BOOL)isEmpty
{
    return (self.root == nil) ? YES : NO;
}

- (NSInteger)getHeight
{
    return self.root.height;
}

- (NSInteger)maxDepth
{
    return self.root.maxDepth;
}

- (NSInteger)numberOfNode
{
    return self.root.count;
}

@end









