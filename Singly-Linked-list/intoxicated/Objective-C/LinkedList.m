//
//  LinkedList.m
//  Data-structure
//
//  Created by R3alFr3e on 1/4/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import "LinkedList.h"

@interface LinkedList ()
@property (nonatomic, strong) NSMutableArray * list;
@property (nonatomic, assign) BOOL isFixed;
@property (nonatomic, assign) NSInteger size;

- (BOOL)checkList;

@end

@implementation LinkedList

- (id)init
{
    if(self = [super init])
    {
        self.list = [[NSMutableArray alloc] init];
        self.isFixed = NO;
        self.size = 0;
    }
    
    return self;
}

- (id)initWithSize:(NSInteger)size
{
    if(self = [super init])
    {
        self.list = [[NSMutableArray alloc] initWithCapacity:size];
        self.isFixed = YES;
        self.size = size;
    }
    
    return self;
}

- (void)insert:(id)obj
{
    if([self checkList])
        ;
    
    [self.list addObject:obj]; //tail
    //[self.list addObject:obj atIndex:0]; //head
    
}

- (void)insertAt:(NSInteger)index Object:(id)obj
{
    if([self checkList])
        ;
    
    if(self.list.count <= index)
        ; //cannot insert at that position
    
    [self.list insertObject:obj atIndex:index];
}

- (void)remove:(id)obj
{
    if(self.list.count == 0)
        ; // empty list
    [self.list removeObject:obj];
}

- (void)removeAt:(NSInteger)index
{
    if(self.list.count == 0)
        ; // empty list
    [self.list removeObjectAtIndex:index];
}

- (NSInteger)lookup:(id)obj
{
    return [self.list indexOfObject:obj] != NSNotFound ? [self.list indexOfObject:obj] : -1;
}

- (LinkedList *)reverse
{
    if(self.list.count == 0)
        ; //empty list
    LinkedList * revList = [[LinkedList alloc] initWithSize:self.list.count];

    NSEnumerator *enumerator = [self.list reverseObjectEnumerator];
    for (id element in enumerator) {
        [revList insert:element];
    }
    return revList;
}

- (NSInteger)size
{
    return self.list.count;
}

- (void)print_list
{
    for(id obj in self.list)
    {
        NSLog(@"%@ =>" ,obj);
    }
}

- (BOOL)checkList{
    if(self.isFixed && self.list.count == self.size)
        return NO; //warning cannot insert
    return YES;
}

@end
