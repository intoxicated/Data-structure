//
//  BinaryTree.h
//  Data-structure
//
//  Created by R3alFr3e on 1/4/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinaryTree.h"

@class Node;

@interface BinarySearchTree : BinaryTree 

//balance tree, future works
//- (BinarySearchTree *)mirror;
//- (void)makeBalance;
//- (BOOL)isBalanced;

- (void)printPathTo:(NSInteger)value;

//misc methods, future works
//- (NSInteger)pathSumToValue:(NSInteger)value;
//- (BOOL)isEqualToTree:(BinarySearchTree *)otherRoot;

@end
