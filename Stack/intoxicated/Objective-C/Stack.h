//
//  Stack.h
//  Data-structure
//
//  Created by R3alFr3e on 1/6/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

- (id)init;
- (id)initWith:(NSInteger)size;
- (id)initWithStack:(Stack *)otherStack;

//access
- (id)pop;
- (id)top;
- (void)push:(id)obj;

//stack info
- (NSInteger)size;
- (BOOL)isEmpty;

//misc
- (NSArray *)allObjects;

@end
