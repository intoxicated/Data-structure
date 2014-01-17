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

//- (Node *)balance:(Node *)node;

//helper methods for making balanced tree
//- (Node *)leftRotate:(Node *)node;
//- (Node *)rightRotate:(Node *)node;
//- (Node *)doubleLeftRotate:(Node *)node;
//- (Node *)doubleRightRotate:(Node *)node;

- (Node *)rightMostNode:(Node *)node;
- (Node *)leftMostNode:(Node *)node;

//traverse
//- (void)inOrderTraverse:(Node *)node;
//- (void)preOrderTraverse:(Node *)node;
//- (void)postOrderTraverse:(Node *)node;

//- (NSInteger)getHeight:(Node *)root;
//- (NSInteger)getCount:(Node *)root;

@property (nonatomic, strong) Node * del;
@property (nonatomic, strong) Node * last;
@property (nonatomic, assign) BOOL isFound;

@end

@implementation BinarySearchTree

#pragma mark - BinaryTree delegate

/**
 *
 *
 */
- (Node *)insertNode:(Node *)node withValue:(NSInteger)value
{
    if(node == nil) //current node is empty
        node = [[Node alloc] initWithValue:value];
    else if(value > node.value) //greater than current node, traverse right
        node.rightChild = [self insertNode:node.rightChild withValue:value];
    else if(value < node.value)
        node.leftChild = [self insertNode:node.leftChild withValue:value];
    else
       ;//warn same value
    
    //update node information
    node.count = [self getCount:node];
    node.height = [self getHeight:node];
    
    return node;
}

- (Node *)leftMostNode:(Node *)node
{
    return nil;
}

- (Node *)rightMostNode:(Node *)node
{
    Node * temp = node;
    
    while (temp.rightChild != nil) {
        temp = temp.rightChild;
    }
    
    return temp;
}

- (Node *)deleteNodeHelper:(Node *)node
{
    Node * temp = node;
    
    if(node.leftChild != nil && node.rightChild != nil) //both child
    {
        temp = [self rightMostNode:node.leftChild];
        node.value = temp.value;
        node.leftChild = [self deleteNode:node.leftChild parent:nil withValue:node.value];
    }
    else if(node.leftChild != nil) //left child
    {
        node = node.leftChild;
        temp = nil;
    }
    else //right child or non
    {
        node = node.rightChild;
        temp = nil;
    }
    return node;
}
/**
 *
 *
 */
- (Node *)deleteNode:(Node *)node parent:(Node *)parent withValue:(NSInteger)value
{
    if(node == nil)
        return nil;
    
    if(node.value > value)
        node.leftChild = [self deleteNode:node.leftChild parent:node withValue:value];
    else if(node.value < value)
        node.rightChild = [self deleteNode:node.rightChild parent:node withValue:value];
    else // match
        node = [self deleteNodeHelper:node];
    
    node.height = [self getHeight:node];
    node.count = [self getCount:node];
    
    
    /** other approach to remove & update tree **/
    //TBD
    return node;
}

/**
 *
 *
 */
- (Node *)lookupNode:(Node *)node withValue:(NSInteger)value
{
    if(node == nil)
        return nil; //raise exception or warning
    
    if(value > node.value)
        return [self lookupNode:node.rightChild withValue:value];
    else if(value < node.value)
        return [self lookupNode:node.leftChild withValue:value];
    else // find value
        return node;
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

@end









