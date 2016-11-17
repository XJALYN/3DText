//
//  ViewController.m
//  Text
//
//  Created by xu jie on 2016/11/17.
//  Copyright © 2016年 xujie. All rights reserved.
//

#import "ViewController.h"
#import <SceneKit/SceneKit.h>
#import "OS3DLabel.h"
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    OS3DLabel *label = [[OS3DLabel alloc]initWithFrame:CGRectMake(0, 10, self.view.bounds.size.width, 100)];
    /// 是否可以控制
    label.allowsControl = true;
    /// 设置
    label.backgroundColor = [UIColor purpleColor];
    /// 单行显示
    label.isSingle = YES;
    /// 设置字体的大小
    label.fontSize = 2;
    /// 设置文字内容
    label.text = @"让学习成为一种习惯---酷走天涯";
    /// 设置尾部省略模式
    label.truncationMode = kCATruncationMiddle;
    
    /// 设置对其方式
    label.alignmentMode = kCAAlignmentCenter;

    /// 设置深度
    label.depth = 0.5;
    
    /// 设置填充内容
    label.contents = [UIImage imageNamed:@"1.png"];
    /// 设置颜色
    label.textColor = [UIColor greenColor];
    
    /// 设置环境场景
    label.scene.background.contents = @"skybox01_cube.png";
   
    [self.view addSubview:label];
    
    [self addAdView];
    
    
}

-(void)addAdView{
    GADBannerView *bannerView = [[GADBannerView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-50, self.view.bounds.size.width, 50)];
    [self.view addSubview:bannerView];
    bannerView.adUnitID = @"ca-app-pub-3629819764559170/3550577647";
    bannerView.rootViewController = self;
    bannerView.autoloadEnabled = true;
    GADRequest *request = [GADRequest request];
    [ bannerView loadRequest:request];
}

-(void)setup{
  
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
