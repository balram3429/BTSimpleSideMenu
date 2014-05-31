//
//  btSimpleMenuItem.m
//  btSimpleSideMenuDemo
//
//  Created by Balram Tiwari on 31/05/14.
//  Copyright (c) 2014 Balram Tiwari. All rights reserved.
//

#import "btSimpleMenuItem.h"

@implementation btSimpleMenuItem

-(id)initWithTitle:(NSString *)title image:(UIImage *)image onCompletion:(completion)completionBlock;
{
    self = [super init];
    if(self)
    {
        self.title = title;
        self.image = image;
        self.block = completionBlock;
    }
    
    return self;
}

@end
