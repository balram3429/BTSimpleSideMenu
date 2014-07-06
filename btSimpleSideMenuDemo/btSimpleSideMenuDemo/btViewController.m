//
//  btViewController.m
//  BTSimpleSideMenuDemo
//
//  Created by Balram on 29/05/14.
//  Copyright (c) 2014 Balram Tiwari. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>
#import "btViewController.h"
#import "BTSimpleSideMenu.h"

@interface btViewController () <BTSimpleSideMenuDelegate>
@property(nonatomic)BTSimpleSideMenu *sideMenu;
@end

@implementation btViewController
@synthesize sideMenu, bgView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Simple Side Menu";
    self.navigationController.navigationBarHidden = YES;
    bgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"backGround.jpg"]];
    bgView.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:bgView];
    UIImageView *author = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"author.png"]];
    author.frame = CGRectMake(120, 30, 95, 95);
    author.alpha = 0.4;
    [self.view addSubview:author];
    author.layer.borderColor = [UIColor whiteColor].CGColor;
    author.layer.borderWidth = 3;
    author.clipsToBounds = YES;
    author.layer.cornerRadius =  author.frame.size.width/2;
    
    
//    sideMenu = [[BTSimpleSideMenu alloc]initWithItemTitles:@[@"One", @"Two", @"Three", @"Four",@"Five", @"Six", @"Seven"]
//                                             andItemImages:@[
//                                                             [UIImage imageNamed:@"icon1.jpeg"],
//                                                             [UIImage imageNamed:@"icon2.jpeg"],
//                                                             [UIImage imageNamed:@"icon3.jpeg"],
//                                                             [UIImage imageNamed:@"icon4.jpeg"],
//                                                             [UIImage imageNamed:@"icon5.jpeg"],
//                                                             [UIImage imageNamed:@"icon6.jpeg"],
//                                                             [UIImage imageNamed:@"icon7.jpeg"]
//                                                             ]
//                                       addToViewController:self];
    sideMenu.delegate = self;
    
    BTSimpleMenuItem *item1 = [[BTSimpleMenuItem alloc]initWithTitle:@"One"
                                                               image:[UIImage imageNamed:@"icon1.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 1");
                                                        }];
    
    BTSimpleMenuItem *item2 = [[BTSimpleMenuItem alloc]initWithTitle:@"Two"
                                                               image:[UIImage imageNamed:@"icon2.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 2");
                                                        }];
    
    BTSimpleMenuItem *item3 = [[BTSimpleMenuItem alloc]initWithTitle:@"Three"
                                                               image:[UIImage imageNamed:@"icon3.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 3");
                                                        }];
    
    BTSimpleMenuItem *item4 = [[BTSimpleMenuItem alloc]initWithTitle:@"Four"
                                                               image:[UIImage imageNamed:@"icon4.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            NSLog(@"I am Item 4");
                                                        }];
    
    BTSimpleMenuItem *item5 = [[BTSimpleMenuItem alloc]initWithTitle:@"Five"
                                                               image:[UIImage imageNamed:@"icon5.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 5");
                                                        }];
    
    BTSimpleMenuItem *item6 = [[BTSimpleMenuItem alloc]initWithTitle:@"Six"
                                                               image:[UIImage imageNamed:@"icon6.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 6");
                                                        }];
    
    BTSimpleMenuItem *item7 = [[BTSimpleMenuItem alloc]initWithTitle:@"Seven"
                                                               image:[UIImage imageNamed:@"icon7.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 7");
                                                            
                                                        }];
    
    sideMenu = [[BTSimpleSideMenu alloc]initWithItem:@[item1, item2, item3, item4, item5, item6, item7]
                                 addToViewController:self];
    
    
}

-(void)viewDidAppear:(BOOL)animated {
    
}

-(void)show{
    [sideMenu toggleMenu];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark BTSimpleSideMenuDelegate

-(void)BTSimpleSideMenu:(BTSimpleSideMenu *)menu didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"Item Cliecked : %ld", (long)index);
}

-(void)BTSimpleSideMenu:(BTSimpleSideMenu *)menu selectedItemTitle:(NSString *)title {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Menu Clicked"
                                                   message:[NSString stringWithFormat:@"Item Title : %@", title]
                                                  delegate:self
                                         cancelButtonTitle:@"Dismiss"
                                         otherButtonTitles:nil, nil];
    [alert show];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
