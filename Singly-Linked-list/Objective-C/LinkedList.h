//
//  LinkedList.h
//  Data-structure
//
//  Created by R3alFr3e on 1/4/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkedList : NSObject

- (id)init;
- (id)initWithSize:(NSInteger)size;

- (void)insert:(id)obj;
- (void)insertAt:(NSInteger)index Object:(id)obj;
- (void)remove:(id)obj;
- (void)removeAt:(NSInteger)index;
- (NSInteger)lookup:(id)obj;

- (LinkedList *)reverse;

- (NSInteger)size;
- (void)print_list;

@end
