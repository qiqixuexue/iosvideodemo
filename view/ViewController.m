//
//  ViewController.m
//  view
//
//  Created by 严琪 on 2017/5/31.
//  Copyright © 2017年 严琪. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"



@interface ViewController ()


@end



@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (IBAction)jump2table:(id)sender {
    SecondViewController *viewcontroller = [[SecondViewController alloc] init];
//    [self presentViewController:viewcontroller animated:YES completion:nil];
      [self.navigationController pushViewController:viewcontroller animated:NO];
}

- (IBAction)jump2controller:(id)sender {
    ThirdViewController  *viewcontroller = [[ThirdViewController alloc] init];
//    [self presentViewController:viewcontroller animated:YES completion:nil];
    [self.navigationController pushViewController:viewcontroller animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
