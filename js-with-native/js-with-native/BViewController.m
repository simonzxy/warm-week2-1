//
//  BViewController.m
//  js-with-native
//
//  Created by 朱益达 on 16/7/25.
//  Copyright © 2016年 朱益达. All rights reserved.
//

#import "BViewController.h"
#import "AViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>




@interface BViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)JSContext *context;
@property(nonatomic,strong)UIWebView *web;

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _web =[[UIWebView alloc] init];
    _web.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:_web];
    _web.delegate = self;
    //获取本地文件路径，webview加载
    NSString *pathml = [[NSBundle mainBundle] pathForResource:@"b" ofType:@"html"];
    NSURL *url =  [NSURL URLWithString:pathml];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_web loadRequest:request];

}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    //获得加载的webview的jscontext
    _context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    __weak typeof(self) weakSelf = self;
    //js与oc交互之js调用oc
    _context[@"push"] = ^(){
        NSLog(@"点击A");
        AViewController *avc = [[AViewController alloc] init];
        [weakSelf.navigationController pushViewController:avc animated:YES];
        [weakSelf removeFromParentViewController];
        };
    _context[@"call"] = ^(){
    
        NSLog(@"API呼叫");//测试代码
        LOG_METHOD;
        
        [weakSelf apicall];//自定义方法进行网络请求
    };
    
}
//自定义方法（减少block块中代码量）
-(void)apicall{

    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"http://v.juhe.cn/nba/team_info_byId.php?team_id=8&key=e34f42ff859ed3aa974401bdde36dccf"];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
       //js与oc交互之 oc调用js
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *jscode = [NSString stringWithFormat:@"api(%@)",str];
            [_context evaluateScript:jscode];
           // NSLog(@"%@",str);//测试代码
        });
        
    }];
    [task resume];

    
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
