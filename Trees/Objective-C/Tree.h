//
//  Tree.h
//  Data-structure
//
//  Created by R3alFr3e on 1/16/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//
//  Abstract class for Tree data structure

#import <Foundation/Foundation.h>
#import "TreeModificationDelegate.h"

@class Node;

@interface Tree : NSObject <TreeModificationDelegate>

@property (nonatomic, strong) Node * root;
@property (nonatomic, strong) Node * freeNodeList;

- (NSInteger)getHeight;
- (NSInteger)getCounts;
- (NSInteger)getHeight:(Node *)root;
- (NSInteger)getCount:(Node *)node;

- (BOOL)isEmpty;
- (BOOL)isBalanced;

- (void)insertNode:(NSInteger)value;
- (void)deleteNode:(NSInteger)value;
- (BOOL)lookupValue:(NSInteger)value;

- (void)printInOrder;
- (void)printPreOrder;
- (void)printPostOrder;
- (void)printPathTo:(NSInteger)value;

- (NSArray *)getInOrder;
- (NSArray *)getPreOrder;
- (NSArray *)getPostOrder;

- (void)recycleNode:(Node *)node;

@end
