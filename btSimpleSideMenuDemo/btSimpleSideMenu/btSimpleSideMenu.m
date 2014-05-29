//
//  btSimpleSideMenu.m
//  btSimpleSideMenuDemo
//
//  Created by Balram on 29/05/14.
//  Copyright (c) 2014 Balram Tiwari. All rights reserved.
//

#define BACKGROUND_COLOR [UIColor colorWithWhite:0 alpha:0.5]
#define GENERIC_IMAGE_FRAME CGRectMake(0, 0, 40, 40)
#define MENU_WIDTH 150

#import "btSimpleSideMenu.h"

@implementation btSimpleSideMenu

#pragma -mark public methods
-(instancetype)initWithItemTitles:(NSArray *)itemsTitle addToViewController:(UIViewController *)sender {
    
    if ((self = [super init])) {
        // perform the other initialization of items.
        [self commonInit:sender];
        titleArray = itemsTitle;
        
    }
    return self;
}

-(instancetype)initWithItemTitles:(NSArray *)itemsTitle andItemImages:(NSArray *)itemsImage addToViewController:(UIViewController *)sender{
    if ((self = [super init])) {
        // perform the other initialization of items.
        [self commonInit:sender];
        titleArray = itemsTitle;
        imageArray = itemsImage;
    }
    return self;
}

-(void)toggleMenu{
    if(!isOpen){
        [self show];
    }else {
        [self hide];
    }
}
-(void)show{
    if(!isOpen){
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = CGRectMake(xAxis, yAxis, width, height);
            menuTable.frame = CGRectMake(menuTable.frame.origin.x, menuTable.frame.origin.y+15, width, height);
            menuTable.alpha = 1;
        }];
        isOpen = YES;
    }
}

-(void)hide {
    if(isOpen){
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = CGRectMake(-width, yAxis, width, height);
            menuTable.frame = CGRectMake(-menuTable.frame.origin.x, menuTable.frame.origin.y-15, width, height);
            menuTable.alpha = 0;
        }];
        isOpen = NO;
    }
}

#pragma -mark tableView Delegates

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [titleArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate btSimpleSideMenu:self didSelectItemAtIndex:indexPath.row];
    [self.delegate btSimpleSideMenu:self selectedItemTitle:[titleArray objectAtIndex:indexPath.row]];
    [self hide];
    [menuTable deselectRowAtIndexPath:indexPath animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = [titleArray objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir Next" size:14];
    
    if(imageArray){
        cell.imageView.image = [self reducedImage:[imageArray objectAtIndex:indexPath.row]];
        cell.imageView.frame = GENERIC_IMAGE_FRAME;
        
        cell.imageView.layer.borderWidth = 2;
        cell.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        cell.imageView.layer.cornerRadius = cell.imageView.frame.size.width/2;
        cell.imageView.clipsToBounds = YES;
    }
    
    return cell;
}

#pragma -mark Private helpers
-(void)commonInit:(UIViewController *)sender{
    
    CGRect screenSize = [UIScreen mainScreen].bounds;
    xAxis = 0;
    yAxis = 0;
    height = screenSize.size.height;
    width = MENU_WIDTH;
    
    self.frame = CGRectMake(-width, yAxis, width, height);
    self.backgroundColor = BACKGROUND_COLOR;
    if(!sender.navigationController.navigationBarHidden) {
        menuTable = [[UITableView alloc]initWithFrame:CGRectMake(xAxis, yAxis+15, width, height) style:UITableViewStyleGrouped];
    }else {
        menuTable = [[UITableView alloc]initWithFrame:CGRectMake(xAxis, yAxis-15, width, height) style:UITableViewStyleGrouped];
    }
    [menuTable setBackgroundColor:[UIColor clearColor]];
    [menuTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [menuTable setShowsVerticalScrollIndicator:NO];
    menuTable.delegate = self;
    menuTable.dataSource = self;
    menuTable.alpha = 0;
    isOpen = NO;
    [self addSubview:menuTable];
    
    gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toggleMenu)];
    gesture.numberOfTapsRequired = 2;
    
    [sender.view addSubview:self];
    [sender.view addGestureRecognizer:gesture];

}

-(UIImage *)reducedImage:(UIImage *)srcImage{
    UIImage *image = srcImage;
    UIImage *tempImage = nil;
    CGSize targetSize = CGSizeMake(40,40);
    UIGraphicsBeginImageContext(targetSize);
    
    CGRect thumbnailRect = CGRectMake(0, 0, 0, 0);
    thumbnailRect.origin = CGPointMake(0.0,0.0);
    thumbnailRect.size.width  = targetSize.width;
    thumbnailRect.size.height = targetSize.height;
    
    [image drawInRect:thumbnailRect];
    
    tempImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return tempImage;

}
@end
