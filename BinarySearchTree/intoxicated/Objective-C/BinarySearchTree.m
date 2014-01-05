//
//  BinaryTree.m
//  Data-structure
//
//  Created by R3alFr3e on 1/4/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import "BinarySearchTree.h"
#import "Node.h"

@interface BinarySearchTree (PrivateAPI)

- (Node *)insert:(Node *)node withValue:(NSInteger)value;
- (Node *)delete:(Node *)node withValue:(NSInteger)value;
- (Node *)lookup:(Node *)node withValue:(NSInteger)value;
- (Node *)deleteNodeAndConnect:(Node *)node;

- (Node *)balance:(Node *)node;

//helper methods for making balanced tree
- (Node *)leftRotate:(Node *)node;
- (Node *)rightRotate:(Node *)node;
- (Node *)doubleLeftRotate:(Node *)node;
- (Node *)doubleRightRotate:(Node *)node;

- (Node *)rightMostNode:(Node *)node;
- (Node *)leftMostNode:(Node *)node;

//traverse
- (void)inOrderTraverse:(Node *)node;
- (void)preOrderTraverse:(Node *)node;
- (void)postOrderTraverse:(Node *)node;

- (NSInteger)getHeight:(Node *)root;
- (NSInteger)getCount:(Node *)root;

@property (nonatomic, strong) Node * del;
@property (nonatomic, strong) Node * last;
@property (nonatomic, strong) Node * freeNodeList;
@property (nonatomic, assign) BOOL isFound;

@end

@implementation BinarySearchTree

/**
 *
 *
 */
- (id)init
{
    if(self = [super init])
    {
        
    }
    return self;
}

#pragma mark - modification methods

/**
 *
 *
 */
- (void)insertNode:(NSInteger)value
{
    [self insert:self.root withValue:value];
}

/**
 *
 *
 */
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
    
    //update node information
    node.count = [self getCount:node];
    node.height = [self getHeight:node];
    
    return node;
}

/**
 *
 *
 */
- (void)deleteNode:(NSInteger)value
{
    self.root = [self delete:self.root withValue:value];
}

/**
 *
 *
 */
- (Node *)delete:(Node *)node withValue:(NSInteger)value
{
    if(node == nil)
        ; //raise exception or warning , either couldnt find value or empty tree
    
    self.last = node;
    if(value < node.value)
        node = [self delete:node.leftChild withValue:value];
    else
    {
        self.del = node;
        node = [self delete:node.rightChild withValue:value];
    }
    
    //check if we find node
    if(node == self.last)
    {
        if(self.del != nil && value == self.del.value)
        {
            if(self.del == self.last) //check if node is rightmost
                node = node.leftChild;
            else
            {
                [self.del swapDataWith:self.last];
                node = node.rightChild;
            }
            [self recycleNode:self.last];
        }
    }
    else //update node information
    {
        node.height = [self getHeight:node];
        node.count = [self getCount:node];
    }
    
    /** other approach to remove & update tree **/
    //TBD
    
    return node;
}

/**
 *
 *
 */
- (Node *)deleteNodeAndConnect:(Node *)node
{
    return nil;
}

/**
 *
 *
 */
- (BOOL)lookupValue:(NSInteger)value
{
    self.isFound = NO;
    self.root = [self lookup:self.root withValue:value];
    return self.isFound;
}

/**
 *
 *
 */
- (Node *)lookup:(Node *)node withValue:(NSInteger)value
{
    if(node == nil)
        ; //raise exception or warning
    
    if(value > node.value)
        node = [self lookup:node.rightChild withValue:value];
    else if(value < node.value)
        node = [self lookup:node.leftChild withValue:value];
    else // find value
        self.isFound = YES;
    return node;
}

#pragma mark - traversal methods

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

/**
 *
 *
 */
- (void)pathToHelper:(Node *)node WithValue:(NSInteger)value
{
    if(node == nil)
        return;
    
    printf("%ld(%ld) ", node.value, node.height);
    
    if(value < node.value)
        [self pathToHelper:node.leftChild WithValue:value];
    else if(value > node.value)
        [self pathToHelper:node.rightChild WithValue:value];
    else //final destination
        return;
}

/**
 *
 *
 */
- (void)printPathTo:(NSInteger)value
{
    if(self.root == nil)
        ; //warn tree is empty
    else
        [self pathToHelper:self.root WithValue:value];
}

#pragma mark - misc methods

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

#pragma mark - tree information

/**
 *
 *
 */
- (BOOL)isEmpty
{
    return (self.root == nil) ? YES : NO;
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

/**
 *
 *
 */
- (NSInteger)getHeight
{
    return self.root.height;
}


- (NSInteger)getCount:(Node *)root
{
    Node * left = root.leftChild, * right = root.rightChild;
    
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
- (NSInteger)numberOfNode
{
    return self.root.count;
}

@end









