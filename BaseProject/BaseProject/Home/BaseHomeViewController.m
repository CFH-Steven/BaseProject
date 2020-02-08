//
//  BaseHomeViewController.m
//  BaseProject
//
//  Created by chenfeihong on 2020/2/8.
//  Copyright © 2020 chenfeihong. All rights reserved.
//

#import "BaseHomeViewController.h"

@interface BaseHomeViewController ()

@end

@implementation BaseHomeViewController

#pragma mark - Life Cycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];

}

- (void)viewDidLoad {
    [super viewDidLoad];

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

#pragma mark - Service

#pragma mark - Event

#pragma mark - Private

#pragma mark - Delegate

#pragma mark - Getter / Setter
@end
