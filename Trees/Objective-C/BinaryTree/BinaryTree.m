//
//  BinaryTree.m
//  Data-structure
//
//  Created by R3alFr3e on 1/16/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import "BinaryTree.h"
#import "Node.h"

@interface BinaryTree ()

- (BOOL)isBalanced:(Node *)node;
- (Node *)find:(NSInteger)value;

- (NSInteger)getHeight:(Node *)root;
- (NSInteger)getCount:(Node *)root;

@end

@implementation BinaryTree

- (id)init
{
    if(self = [super init])
    {
        self.root = nil;
        //self.delegate = self;
    }
    return self;
}


/**
 *
 *
 */
- (NSInteger)getCounts
{
    return [self getCount:self.root];
}

/**
 *
 *
 */
- (NSInteger)getCount:(Node *)node
{
    Node * left = node.leftChild, * right = node.rightChild;
    
    if(left == nil && right == nil)
        return 1;
    else if(left == nil)
        return 1 + right.count;
    else if(right == nil)
        return 1 + left.count;
    else
        return 1 + left.count + right.count;
}

/**
 *
 *
 */
- (NSInteger)getHeight
{
    return [self getHeight:self.root];
}

- (NSInteger)getHeight:(Node *)root
{
    Node * left = root.leftChild, * right = root.rightChild;
    
    if(left == nil && right == nil)
        return 0;
    else if(left == nil)
        return 1 + right.height;
    else if(right == nil)
        return 1 + left.height;
    else
        return 1 + MAX(left.height, right.height);
}

- (BOOL)isEmpty
{
    return (self.root == nil) ? YES : NO;
}

- (BOOL)isBalanced
{
    return [self isBalanced:self.root];
}

- (BOOL)isBalanced:(Node *)node
{
    NSInteger lh; /* for height of left subtree */
    NSInteger rh; /* for height of right subtree */
    
    /* If tree is empty then return true */
    if(self.root == NULL)
        return YES;
    
    /* Get the height of left and right sub trees */
    lh = self.root.leftChild.height;
    rh = self.root.leftChild.height;;
    
    if([self isBalanced:self.root.leftChild] && [self isBalanced:self.root.rightChild]
       && labs(lh-rh) <= 1)
        return YES;
    
    /* If we reach here then tree is not height-balanced */
    return NO;
}

#pragma mark - Access methods

- (void)insertNode:(NSInteger)value
{
    self.root = [self insertNode:self.root withValue:value];
}

- (Node *)insertNode:(Node *)node withValue:(NSInteger)value
{
    NSLog(@"BTree insertion");
    return nil;
}

- (void)deleteNode:(NSInteger)value
{
    self.root = [self deleteNode:self.root parent:nil withValue:value];
}

- (Node *)deleteNode:(Node *)node parent:(Node *)parent withValue:(NSInteger)value
{
    return nil;
}

- (BOOL)lookupValue:(NSInteger)value
{
    return [self lookupNode:self.root withValue:value] ? YES : NO;
}

- (Node *)lookupNode:(Node *)node withValue:(NSInteger)value
{
    return nil;
}

- (Node *)find:(NSInteger)value
{
    return nil;
}

- (void)swap:(Node *)anode with:(Node *)bnode
{
    //find position of two nodes via find and swap its value
}

#pragma mark - Misc. methods


/**
 *
 *
 */
- (void)recycleNode:(Node *)node
{
    node.leftChild = nil;
    node.rightChild = self.freeNodeList;
    self.freeNodeList = node;
}

#pragma mark - traversal methods (overrided)

/**
 *
 *
 */
- (void)printInOrder
{
    if(self.root == nil)
        ; //warn tree is empty
    else
        [self inOrderTraverse:self.root];
}

/**
 *
 *
 */
- (void)inOrderTraverse:(Node *)node
{
    if(node == nil)
        return;
    
    [self inOrderTraverse:node.leftChild];
    printf("%ld(%ld) ", node.value, node.height);
    [self inOrderTraverse:node.rightChild];
}

/**
 *
 *
 */
- (void)printPreOrder
{
    if(self.root == nil)
        ; //warn tree is empty
    else
        [self preOrderTraverse:self.root];
}

/**
 *
 *
 */
- (void)preOrderTraverse:(Node *)node
{
    if(node == nil)
        return;
    
    printf("%ld(%ld) ", node.value, node.height);
    [self inOrderTraverse:node.leftChild];
    [self inOrderTraverse:node.rightChild];
    
}

/**
 *
 *
 */
- (void)printPostOrder
{
    if(self.root == nil)
        ; //warn tree is empty
    else
        [self postOrderTraverse:self.root];
}

/**
 *
 *
 */
- (void)postOrderTraverse:(Node *)node
{
    if(node == nil)
        return;
    
    [self inOrderTraverse:node.leftChild];
    [self inOrderTraverse:node.rightChild];
    printf("%ld(%ld) ", node.value, node.height);
}

- (void)printPathTo:(NSInteger)value
{
    
}

- (NSArray *)getInOrder
{
    return nil;
}

- (NSArray *)getPostOrder
{
    return nil;
}

- (NSArray *)getPreOrder
{
    return nil;
}

@end
