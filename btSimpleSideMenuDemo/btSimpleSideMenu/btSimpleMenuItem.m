//
//  BTSimpleMenuItem.m
//  BTSimpleSideMenuDemo
//
//  Created by Balram Tiwari on 31/05/14.
//  Copyright (c) 2014 Balram Tiwari. All rights reserved.
//

#import "BTSimpleMenuItem.h"

@implementation BTSimpleMenuItem

-(id)initWithTitle:(NSString *)title image:(UIImage *)image onCompletion:(completion)completionBlock;
{
    self = [super init];
    if(self)
    {
        self.title = title;
        self.image = image;
        self.block = completionBlock;
        self.imageView = [[UIImageView alloc]initWithImage:image];
        self.imageView.frame = CGRectMake(0, 0, 40, 40);
    }
    
    return self;
}

@end
