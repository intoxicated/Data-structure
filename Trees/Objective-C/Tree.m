//
//  Tree.m
//  Data-structure
//
//  Created by R3alFr3e on 1/16/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//
//  Abstract class methods, these methods have to be overrided by subclass

#import "Tree.h"

@implementation Tree

- (NSInteger)getHeight
{
    return 0;
}
- (NSInteger)getCounts
{
    return 0;
}
- (NSInteger)getHeight:(Node *)root
{
    return 0;
}
- (NSInteger)getCount:(Node *)node
{
    return 0;
}

- (BOOL)isEmpty
{
    return NO;
}
- (BOOL)isBalanced
{
    return NO;
}

- (void)insertNode:(NSInteger)value
{
    
}
- (void)deleteNode:(NSInteger)value
{
    
}
- (BOOL)lookupValue:(NSInteger)value
{
    return NO;
}

- (void)printInOrder
{
    
}
- (void)printPreOrder
{
    
}
- (void)printPostOrder
{
    
}
- (void)printPathTo:(NSInteger)value
{
    
}

- (NSArray *)getInOrder
{
    return nil;
}
- (NSArray *)getPreOrder
{
    return nil;
}
- (NSArray *)getPostOrder
{
    return nil;
}

- (void)recycleNode:(Node *)node
{
    
}

- (Node *)insertNode:(Node *)node withValue:(NSInteger)value
{
    return nil;
}
- (Node *)deleteNode:(Node *)node parent:(Node *)parent withValue:(NSInteger)value
{
    return nil;
}
- (Node *)lookupNode:(Node *)node withValue:(NSInteger)value
{
    return nil;
}

@end
