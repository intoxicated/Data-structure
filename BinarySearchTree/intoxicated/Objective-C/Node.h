//
//  Node.h
//  Data-structure
//
//  Created by R3alFr3e on 1/4/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (nonatomic, strong) Node * rightChild;
@property (nonatomic, strong) Node * leftChild;
@property (nonatomic, assign) NSInteger value;

@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger maxDepth;

- (id)initWithValue:(NSInteger)value;

- (BOOL)hasOneChild;
- (BOOL)hasTwoChildren;
- (BOOL)isLeaf;

@end
