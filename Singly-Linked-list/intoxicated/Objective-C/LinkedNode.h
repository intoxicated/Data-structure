//
//  LinkedNode.h
//  Data-structure
//
//  Created by R3alFr3e on 1/10/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkedNode : NSObject

@property (nonatomic, strong) id item;
@property (nonatomic, strong) LinkedNode * next;
@property (nonatomic, strong) LinkedNode * prev;

@end
