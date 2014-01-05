//
//  BinaryTree.h
//  Data-structure
//
//  Created by R3alFr3e on 1/4/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Node;

@interface BinarySearchTree : NSObject

@property (nonatomic, strong) Node * root;

- (id)init;

//tree information methods
- (NSInteger)getHeight;
- (NSInteger)numberOfNode;
- (NSInteger)maxDepth;
- (BOOL)isEmpty;

//access methods
- (void)insertNode:(NSInteger)value;
- (void)deleteNode:(NSInteger)value;
- (BOOL)lookupValue:(NSInteger)value;

- (BinarySearchTree *)mirror;
- (void)makeBalance;
- (BOOL)isBalanced;

//traversal methods
- (void)printInOrder;
- (void)printPreOrder;
- (void)printPostOrder;

//misc methods
- (NSInteger)pathSumToValue:(NSInteger)value;
- (BOOL)isEqualToTree:(BinarySearchTree *)otherRoot;

@end
