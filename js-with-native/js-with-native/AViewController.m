//
//  AViewController.m
//  js-with-native
//
//  Created by 朱益达 on 16/7/25.
//  Copyright © 2016年 朱益达. All rights reserved.
//

#import "AViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "BViewController.h"


@interface AViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)JSContext *context;

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建webview
    UIWebView *web =[[UIWebView alloc] init];
    web.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:web];
    web.delegate = self;
    //获取本地文件路径，webview加载
    NSString *pathml = [[NSBundle mainBundle] pathForResource:@"a" ofType:@"html"];
    NSURL *url =  [NSURL URLWithString:pathml];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [web loadRequest:request];
}


-(void)webViewDidFinishLoad:(UIWebView *)webView{

    _context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    __weak typeof(self) weakSelf = self;
    
    _context[@"print"] = ^(){
    
        BViewController *bvc = [[BViewController alloc] init];
        [weakSelf.navigationController pushViewController:bvc animated:YES];
        [weakSelf removeFromParentViewController];
         
        
        
    };
}



-(void)dealloc{

    NSLog(@"Adealloc");
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
