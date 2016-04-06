//
//  JKViewController.m
//  JKKit
//
//  Created by Ftkey on 03/31/2016.
//  Copyright (c) 2016 Ftkey. All rights reserved.
//

#import "JKViewController.h"
#import <JKKit/JKKit.h>

@interface JKViewController ()

@end

@implementation JKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[JKModel alloc] init];
    [[JKHTTPObject alloc] init];
    [[JKHTTPSessionManager alloc] initWithBaseURL:nil sessionConfiguration:nil];
    [JKFileCache defaultCache];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
