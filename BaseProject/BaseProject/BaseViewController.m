//
//  BaseViewController.m
//  BaseProject
//
//  Created by chenfeihong on 2020/2/8.
//  Copyright © 2020 chenfeihong. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark - Life Cycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
}
/**
 回收通知、强引用
 */
- (void)dealloc {
    
}

#pragma mark - Public

#pragma mark - Init

- (void)initView{
    self.view.backgroundColor = ThemeVCBackgroundColor;
}

#pragma mark - Service

#pragma mark - Event

#pragma mark - Private

#pragma mark - Delegate

#pragma mark - Getter / Setter
@end
