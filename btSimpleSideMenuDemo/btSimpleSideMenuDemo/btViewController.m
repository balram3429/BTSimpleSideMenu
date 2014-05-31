//
//  btViewController.m
//  btSimpleSideMenuDemo
//
//  Created by Balram on 29/05/14.
//  Copyright (c) 2014 Balram Tiwari. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>
#import "btViewController.h"
#import "btSimpleSideMenu.h"

@interface btViewController () <btSimpleSideMenuDelegate>
@property(nonatomic)btSimpleSideMenu *sideMenu;
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
    
    
//    sideMenu = [[btSimpleSideMenu alloc]initWithItemTitles:@[@"One", @"Two", @"Three", @"Four",@"Five", @"Six", @"Seven"]
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
    
    btSimpleMenuItem *item1 = [[btSimpleMenuItem alloc]initWithTitle:@"One"
                                                               image:[UIImage imageNamed:@"icon1.jpeg"]
                                                        onCompletion:^(BOOL success, btSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 1");
                                                        }];
    
    btSimpleMenuItem *item2 = [[btSimpleMenuItem alloc]initWithTitle:@"Two"
                                                               image:[UIImage imageNamed:@"icon2.jpeg"]
                                                        onCompletion:^(BOOL success, btSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 2");
                                                        }];
    
    btSimpleMenuItem *item3 = [[btSimpleMenuItem alloc]initWithTitle:@"Three"
                                                               image:[UIImage imageNamed:@"icon3.jpeg"]
                                                        onCompletion:^(BOOL success, btSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 3");
                                                        }];
    
    btSimpleMenuItem *item4 = [[btSimpleMenuItem alloc]initWithTitle:@"Four"
                                                               image:[UIImage imageNamed:@"icon4.jpeg"]
                                                        onCompletion:^(BOOL success, btSimpleMenuItem *item) {
                                                            NSLog(@"I am Item 4");
                                                        }];
    
    btSimpleMenuItem *item5 = [[btSimpleMenuItem alloc]initWithTitle:@"Five"
                                                               image:[UIImage imageNamed:@"icon5.jpeg"]
                                                        onCompletion:^(BOOL success, btSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 5");
                                                        }];
    
    btSimpleMenuItem *item6 = [[btSimpleMenuItem alloc]initWithTitle:@"Six"
                                                               image:[UIImage imageNamed:@"icon6.jpeg"]
                                                        onCompletion:^(BOOL success, btSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 6");
                                                        }];
    
    btSimpleMenuItem *item7 = [[btSimpleMenuItem alloc]initWithTitle:@"Seven"
                                                               image:[UIImage imageNamed:@"icon7.jpeg"]
                                                        onCompletion:^(BOOL success, btSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 7");
                                                            
                                                        }];
    
    sideMenu = [[btSimpleSideMenu alloc]initWithItem:@[item1, item2, item3, item4, item5, item6, item7]
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

#pragma -mark btSimpleSideMenuDelegate

-(void)btSimpleSideMenu:(btSimpleSideMenu *)menu didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"Item Cliecked : %ld", (long)index);
}

-(void)btSimpleSideMenu:(btSimpleSideMenu *)menu selectedItemTitle:(NSString *)title {
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
