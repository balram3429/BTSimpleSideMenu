//
//  BTSimpleMenuItem.h
//  BTSimpleSideMenuDemo
//
//  Created by Balram Tiwari on 31/05/14.
//  Copyright (c) 2014 Balram Tiwari. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BTSimpleMenuItem;
typedef void (^completion)(BOOL success, BTSimpleMenuItem *item);

@interface BTSimpleMenuItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, copy) completion block;

-(id)initWithTitle:(NSString *)title image:(UIImage *)image onCompletion:(completion)completionBlock;

@end
