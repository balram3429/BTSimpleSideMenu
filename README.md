btSimpleSideMenu
================

This is a simple side menu for iOS

Based on the UITableView, this menu provides a simple approach of creating a side menu for iOS apps.

<img src="https://github.com/balram3429/btSimpleSideMenu/blob/master/btSimpleSideMenuDemo/raw/screen1.jpg" alt="btSimpleSideMenu Screenshot" width="320" height="568" />

<img src="https://github.com/balram3429/btSimpleSideMenu/blob/master/btSimpleSideMenuDemo/raw/screen2.jpg" alt="btSimpleSideMenu Screenshot" width="320" height="568" />

## Requirements
* Xcode 5 or higher
* Apple LLVM compiler
* iOS 7.1 or higher
* ARC

## Demo
Build and run the `btSimpleSideMenuDemo` project in Xcode to see `btSimpleSideMenu` in action.

## Installation
  1. Drag the file `btSimpleSideMenu.h` and `'btSimpleSideMenu.m` to your project folder.
  2. Maken an import statement for the file as `#import"btSimpleSideMenu.h"` .
  3. Add to your project the `QuartzCore framework`.
  4. In your viewController, use these method to initialize the menu with the titles & images as well.

```objective-c
-(instancetype) initWithItemTitles:(NSArray *)itemsTitle addToViewController:(id)sender;
-(instancetype) initWithItemTitles:(NSArray *)itemsTitle andItemImages:(NSArray *)itemsImage addToViewController:(UIViewController *)sender;
```

  
```objective-c
btSimpleSideMenu *sideMenu = [[btSimpleSideMenu alloc]initWithItemTitles:@[@"One", @"Two", @"Three", @"Four",@"Five", @"Six", @"Seven"] addToViewController:self];
 [sideMenu toggleMenu];
```

```objective-c
btSimpleSideMenu *sideMenu = [[btSimpleSideMenu alloc]initWithItemTitles:@[@"One", @"Two", @"Three", @"Four",@"Five", @"Six", @"Seven"]
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
     [sideMenu toggleMenu];
```
You can implement `btSimpleSideMenuDelegate` protocol to receive the following messages:

```objective-c
-(void)btSimpleSideMenu:(btSimpleSideMenu *)menu didSelectItemAtIndex:(NSInteger)index;
-(void)btSimpleSideMenu:(btSimpleSideMenu *)menu selectedItemTitle:(NSString *)title;
```

## Contact

- tiwari.balram@gmail.com

## License

btSimpleSideMenu is available under the MIT license.

Copyright © 2014 Balram Tiwari.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
