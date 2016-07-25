//
//  BViewController.m
//  js-with-native
//
//  Created by 朱益达 on 16/7/25.
//  Copyright © 2016年 朱益达. All rights reserved.
//

#import "BViewController.h"
#import "AppDelegate.h"




@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(100, 100, 40, 40);
//    [btn setTitle:@"按钮" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
//     [self.view addSubview:btn];


    
    


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    NSLog(@"Bdealloc");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
