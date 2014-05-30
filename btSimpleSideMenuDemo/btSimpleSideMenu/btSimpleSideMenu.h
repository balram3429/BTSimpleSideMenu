//
//  btSimpleSideMenu.h
//  btSimpleSideMenuDemo
//
//  Created by Balram on 29/05/14.
//  Copyright (c) 2014 Balram Tiwari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>

@class btSimpleSideMenu;

@protocol btSimpleSideMenuDelegate <NSObject>

@optional
-(void)btSimpleSideMenu:(btSimpleSideMenu *)menu didSelectItemAtIndex:(NSInteger)index;
-(void)btSimpleSideMenu:(btSimpleSideMenu *)menu selectedItemTitle:(NSString *)title;

@end

@interface UIView (btSimpleSideMenu)
- (UIImage *)superScreenshot:(UIView *)sender;
@end

@interface UIImage (btSimpleSideMenu)
- (UIImage *)screenshot;
- (UIImage *)blurredImageWithRadius:(CGFloat)radius iterations:(NSUInteger)iterations tintColor:(UIColor *)tintColor;
@end

@interface btSimpleSideMenu : UIView<UITableViewDelegate, UITableViewDataSource> {
    @private
    UITableView *menuTable;
    CGFloat xAxis, yAxis,height, width;
    NSArray *titleArray;
    NSArray *imageArray;
    BOOL isOpen;
    UITapGestureRecognizer *gesture;
    UISwipeGestureRecognizer *leftSwipe, *rightSwipe;
    UIImage *blurredImage;
    UIImageView *backGroundImage;
    UIImage *screenShotImage;
    UIImageView *screenShotView;
    
}

@property(nonatomic, weak) id <btSimpleSideMenuDelegate> delegate;

-(instancetype) initWithItemTitles:(NSArray *)itemsTitle addToViewController:(id)sender;
-(instancetype) initWithItemTitles:(NSArray *)itemsTitle andItemImages:(NSArray *)itemsImage addToViewController:(UIViewController *)sender;

-(void)show;
-(void)hide;
-(void)toggleMenu;
@end
