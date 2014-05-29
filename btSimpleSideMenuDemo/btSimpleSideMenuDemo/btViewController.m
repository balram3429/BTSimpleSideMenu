//
//  btViewController.m
//  btSimpleSideMenuDemo
//
//  Created by Balram on 29/05/14.
//  Copyright (c) 2014 Balram Tiwari. All rights reserved.
//

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
    
    sideMenu = [[btSimpleSideMenu alloc]initWithItemTitles:@[@"One", @"Two", @"Three", @"Four",@"Five", @"Six", @"Seven"]
                                             andItemImages:@[
                                                             [UIImage imageNamed:@"icon1.jpeg"],
                                                             [UIImage imageNamed:@"icon2.jpeg"],
                                                             [UIImage imageNamed:@"icon3.jpeg"],
                                                             [UIImage imageNamed:@"icon4.jpeg"],
                                                             [UIImage imageNamed:@"icon5.jpeg"],
                                                             [UIImage imageNamed:@"icon6.jpeg"],
                                                             [UIImage imageNamed:@"icon7.jpeg"]
                                                             ]
                                       addToViewController:self];
    sideMenu.delegate = self;
    sideMenu.userInteractionEnabled = YES;
    
    [self performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:NO];
    
}

-(UIImage *)bgView{
    
    return self.bgView.image;
}

-(void)show{
    [sideMenu show];
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
