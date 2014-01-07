//
//  Stack.m
//  Data-structure
//
//  Created by R3alFr3e on 1/6/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import "Stack.h"

@interface Stack (Private)
@property (nonatomic, strong) NSMutableArray * innerStack;
@property (nonatomic, assign) NSInteger size;
@property (nonatomic, assign) BOOL isFixedSize;
@end

@implementation Stack

#pragma mark - init methods

/**
 * Default init
 *
 */
- (id)init
{
    if(self = [super init])
    {
        self.innerStack = [[NSMutableArray alloc] init];
        self.isFixedSize = NO;
    }
    return self;
}

/**
 * Init with fixed size
 * @param size a integer for stack size
 */
- (id)initWith:(NSInteger)size
{
    if(self = [super init])
    {
        self.innerStack = [[NSMutableArray alloc] initWithCapacity:size];
        self.size = size;
        self.isFixedSize = YES;
    }
    return self;
}

/**
 * Init with other stack object
 * @param otherStack another stack object
 */
- (id)initWithStack:(Stack *)otherStack
{
    if(self = [super init])
    {
        self.innerStack = [[NSMutableArray alloc] initWithArray:otherStack.innerStack copyItems:YES];
        if(otherStack.isFixedSize)
        {
            self.size = otherStack.size;
            self.isFixedSize = YES;
        }
    }
    return self;
}

#pragma mark - stack access/modify methods

/**
 * Remove an object from top of the stack and return it
 * @return obj an object on top of the stack
 */
- (id)pop
{
    if([self isEmpty])
        ; //warning nothing to pop
    
    id obj = [self.innerStack lastObject];
    [self.innerStack removeLastObject];
    return obj;
}

/**
 * Return an object from top of the stack
 * @return obj a object on top of the stack
 */
- (id)top
{
    if([self isEmpty])
        ; //warning nothing on stack
    return [self.innerStack lastObject];
}

/**
 * Push an object onto the stack
 * @param obj an object to be pushed onto the stack
 */
- (void)push:(id)obj
{
    if(self.isFixedSize && self.innerStack.count == self.size)
        ; //cannot push anymore due to fix size stack 
    [self.innerStack addObject:obj];
}

#pragma mark - stack information methods

/**
 * Size of the current stack
 * @return integer size of the stack
 */
- (NSInteger)size
{
    return self.innerStack.count;
}

/**
 * Return true if stack is empty, otherwise false
 * @return boolean
 */
- (BOOL)isEmpty
{
    return (self.innerStack.count == 0) ? YES : NO;
}

#pragma mark - misc methdos

/**
 * Return all objects in the stack
 * @return NSArray that contains all objects in the stack 
 */
- (NSArray *)allObjects
{
    return [[NSArray alloc] initWithArray:self.innerStack copyItems:YES];
}
@end
