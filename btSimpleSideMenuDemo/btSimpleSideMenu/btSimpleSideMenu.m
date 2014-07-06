//
//  BTSimpleSideMenu.m
//  BTSimpleSideMenuDemo
//  Created by Balram on 29/05/14.
//  Copyright (c) 2014 Balram Tiwari. All rights reserved.
//

#define BACKGROUND_COLOR [UIColor colorWithWhite:1 alpha:0.2]
#define GENERIC_IMAGE_FRAME CGRectMake(0, 0, 40, 40)
#define MENU_WIDTH 175

#import "BTSimpleSideMenu.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>

@implementation BTSimpleSideMenu

#pragma -mark public methods

-(instancetype) initWithItem:(NSArray *)items addToViewController:(id)sender {
    if ((self = [super init])) {
        // perform the other initialization of items.
        [self commonInit:sender];
        itemsArray = items;
    }
    return self;
}

-(instancetype)initWithItemTitles:(NSArray *)itemsTitle addToViewController:(UIViewController *)sender {
    
    if ((self = [super init])) {
        // perform the other initialization of items.
        [self commonInit:sender];
        NSMutableArray *tempArray = [[NSMutableArray alloc]init];
        for(int i = 0;i<[itemsTitle count]; i++){
            BTSimpleMenuItem *temp = [[BTSimpleMenuItem alloc]initWithTitle:[itemsTitle objectAtIndex:i]
                                                                      image:nil onCompletion:nil];
            [tempArray addObject:temp];
        }
        itemsArray = tempArray;
    }
    return self;
}

-(instancetype)initWithItemTitles:(NSArray *)itemsTitle andItemImages:(NSArray *)itemsImage addToViewController:(UIViewController *)sender{
    if ((self = [super init])) {
        // perform the other initialization of items.
        [self commonInit:sender];
        NSMutableArray *tempArray = [[NSMutableArray alloc]init];
        for(int i = 0;i<[itemsTitle count]; i++){
            BTSimpleMenuItem *temp = [[BTSimpleMenuItem alloc]initWithTitle:[itemsTitle objectAtIndex:i]
                                                                      image:[itemsImage objectAtIndex:i]
                                                               onCompletion:nil];
            [tempArray addObject:temp];
        }
        itemsArray = tempArray;
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
            backGroundImage.frame = CGRectMake(0, 0, width, height);
            backGroundImage.alpha = 1;
        } completion:^(BOOL finished) {
            
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
            backGroundImage.alpha = 0;
            backGroundImage.frame = CGRectMake(width, 0, width, height);
        }];
        isOpen = NO;
    }
}

#pragma -mark tableView Delegates

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [itemsArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.delegate BTSimpleSideMenu:self didSelectItemAtIndex:indexPath.row];
    
    [self.delegate BTSimpleSideMenu:self selectedItemTitle:[[itemsArray objectAtIndex:indexPath.row] title]];
    //[self.delegate BTSimpleSideMenu:self selectedItemTitle:[titleArray objectAtIndex:indexPath.row]];
    _selectedItem = [itemsArray objectAtIndex:indexPath.row];
    [self hide];
    if (_selectedItem.block) {
        BOOL success= YES;
        _selectedItem.block(success, _selectedItem);
    }
    [menuTable deselectRowAtIndexPath:indexPath animated:YES];
}

#define MAIN_VIEW_TAG 1
#define TITLE_LABLE_TAG 2
#define IMAGE_VIEW_TAG 3

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"cell";
    UIView *circleView;
    UILabel *titleLabel;
    UIImageView *imageView;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    BTSimpleMenuItem *item = [itemsArray objectAtIndex:indexPath.row];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor clearColor];
        
        circleView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 55, 55)];
        circleView.tag = MAIN_VIEW_TAG;
        circleView.backgroundColor = [UIColor clearColor];
        circleView.layer.borderWidth = 0.5;
        circleView.layer.borderColor = [UIColor colorWithWhite:0.3 alpha:0.7].CGColor;
        circleView.layer.cornerRadius = circleView.bounds.size.height/2;
        circleView.clipsToBounds = YES;
        
        [cell.contentView addSubview:circleView];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 10.0, 120, 60)];
        titleLabel.tag = TITLE_LABLE_TAG;
        titleLabel.textColor = [UIColor colorWithWhite:0.2 alpha:1];
        titleLabel.font = [UIFont fontWithName:@"Avenir Next" size:16];
        
        [cell.contentView addSubview:titleLabel];
        
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 32, 32)];
        imageView.tag = IMAGE_VIEW_TAG;
        imageView.center = circleView.center;
        [cell.contentView addSubview:imageView];
    }else {
        
        circleView = (UIView *)[cell.contentView viewWithTag:MAIN_VIEW_TAG];
        titleLabel = (UILabel *)[cell.contentView viewWithTag:TITLE_LABLE_TAG];
        imageView = (UIImageView *)[cell.contentView viewWithTag:IMAGE_VIEW_TAG];
    }
    
    titleLabel.text = item.title;
    imageView.image = item.imageView.image;
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
    
    screenShotImage = [sender.view screenshot];
    blurredImage = [screenShotImage blurredImageWithRadius:10.0f iterations:5  tintColor:nil];
    backGroundImage = [[UIImageView alloc]initWithImage:blurredImage];
    backGroundImage.frame = CGRectMake(width,0, width, height);
    backGroundImage.alpha = 0;
    [self addSubview:backGroundImage];
    
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
    
    leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(hide)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    rightSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(show)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    [sender.view addSubview:self];
    [sender.view addGestureRecognizer:gesture];
    [sender.view addGestureRecognizer:rightSwipe];
    [sender.view addGestureRecognizer:leftSwipe];
    
}

-(UIImage *)reducedImage:(UIImage *)srcImage{
    UIImage *image = srcImage;
    UIImage *tempImage = nil;
    CGSize targetSize = CGSizeMake(20,20);
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

@implementation UIView (bt_screenshot)
-(UIImage *)screenshot
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(MENU_WIDTH, [UIScreen mainScreen].bounds.size.height), NO, [UIScreen mainScreen].scale);
    
    if ([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        
        NSInvocation* invoc = [NSInvocation invocationWithMethodSignature:
                               [self methodSignatureForSelector:
                                @selector(drawViewHierarchyInRect:afterScreenUpdates:)]];
        [invoc setTarget:self];
        [invoc setSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)];
        CGRect arg2 = self.bounds;
        BOOL arg3 = YES;
        [invoc setArgument:&arg2 atIndex:2];
        [invoc setArgument:&arg3 atIndex:3];
        [invoc invoke];
    } else {
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

@implementation UIImage (bt_blurrEffect)

- (UIImage *)blurredImageWithRadius:(CGFloat)radius iterations:(NSUInteger)iterations tintColor:(UIColor *)tintColor
{
    //image must be nonzero size
    if (floorf(self.size.width) * floorf(self.size.height) <= 0.0f) return self;
    
    //boxsize must be an odd integer
    uint32_t boxSize = (uint32_t)(radius * self.scale);
    if (boxSize % 2 == 0) boxSize ++;
    
    //create image buffers
    CGImageRef imageRef = self.CGImage;
    vImage_Buffer buffer1, buffer2;
    buffer1.width = buffer2.width = CGImageGetWidth(imageRef);
    buffer1.height = buffer2.height = CGImageGetHeight(imageRef);
    buffer1.rowBytes = buffer2.rowBytes = CGImageGetBytesPerRow(imageRef);
    size_t bytes = buffer1.rowBytes * buffer1.height;
    buffer1.data = malloc(bytes);
    buffer2.data = malloc(bytes);
    
    //create temp buffer
    void *tempBuffer = malloc((size_t)vImageBoxConvolve_ARGB8888(&buffer1, &buffer2, NULL, 0, 0, boxSize, boxSize,
                                                                 NULL, kvImageEdgeExtend + kvImageGetTempBufferSize));
    
    //copy image data
    CFDataRef dataSource = CGDataProviderCopyData(CGImageGetDataProvider(imageRef));
    memcpy(buffer1.data, CFDataGetBytePtr(dataSource), bytes);
    CFRelease(dataSource);
    
    for (NSUInteger i = 0; i < iterations; i++)
    {
        //perform blur
        vImageBoxConvolve_ARGB8888(&buffer1, &buffer2, tempBuffer, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
        
        //swap buffers
        void *temp = buffer1.data;
        buffer1.data = buffer2.data;
        buffer2.data = temp;
    }
    
    //free buffers
    free(buffer2.data);
    free(tempBuffer);
    
    //create image context from buffer
    CGContextRef ctx = CGBitmapContextCreate(buffer1.data, buffer1.width, buffer1.height,
                                             8, buffer1.rowBytes, CGImageGetColorSpace(imageRef),
                                             CGImageGetBitmapInfo(imageRef));
    
    //apply tint
    if (tintColor && CGColorGetAlpha(tintColor.CGColor) > 0.0f)
    {
        CGContextSetFillColorWithColor(ctx, [tintColor colorWithAlphaComponent:0.25].CGColor);
        CGContextSetBlendMode(ctx, kCGBlendModePlusLighter);
        CGContextFillRect(ctx, CGRectMake(0, 0, buffer1.width, buffer1.height));
    }
    
    //create image from context
    imageRef = CGBitmapContextCreateImage(ctx);
    UIImage *image = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    CGContextRelease(ctx);
    free(buffer1.data);
    //    UIImage *image = [[UIImage alloc]init];
    return image;
}

@end


