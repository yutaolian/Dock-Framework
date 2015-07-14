//
//  ViewController.m
//  Dock-Framework
//
//  Created by lyt on 15/3/12.
//  Copyright (c) 2015年 lyt. All rights reserved.
//

#import "ViewController.h"
#import "Dock.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"

#define kDockHight 44
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIView *barBackground = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
    
    barBackground.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:barBackground];
    
    ViewController1 * vc1 = [[ViewController1 alloc] init];
    
    [self addChildViewController:vc1];
    
    ViewController2 * vc2 = [[ViewController2 alloc] init];
    
    [self addChildViewController:vc2];
    
    ViewController3 * vc3 = [[ViewController3 alloc] init];
    
    [self addChildViewController:vc3];
    
    [_dock addItemWithIcon:@"worldcup_icon_1.png" selectedIcon:@"worldcup_icon_11.png" title:@"ONE"];
    
    [_dock addItemWithIcon:@"worldcup_icon_2.png" selectedIcon:@"worldcup_icon_22.png" title:@"TWO"];
    
    [_dock addItemWithIcon:@"worldcup_icon_3.png" selectedIcon:@"worldcup_icon_33.png" title:@"THREE"];
  
    
}

#pragma mark - dock的代理方法
-(void)dock:(Dock *)dock itemSelectedFrom:(int)from to:(int)to
{
    
    if (to<0 || to>=self.childViewControllers.count)
        return;
    //0.移除旧的控制器
    
    UIViewController *oldVC = self.childViewControllers[from];
    
    [oldVC.view removeFromSuperview];
    
    //1.取出即将显示的控制器
    
    UIViewController *newVC = self.childViewControllers[to];
    
    CGFloat width = self.view.frame.size.width;
    // CGFloat height = self.view.frame.size.height -kDockHight -kStatusHeight;
    CGFloat height = self.view.frame.size.height -kDockHight ;
    newVC.view.frame = CGRectMake(0, 0, width, height);
    //2.添加新的控制器
    [self.view addSubview:newVC.view];
    
}
@end
