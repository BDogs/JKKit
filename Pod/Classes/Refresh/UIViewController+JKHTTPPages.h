//
//  UIViewController+JKHTTPPages.h
//  XS
//
//  Created by Futao on 16/3/30.
//  Copyright © 2016年 JKSoft. All rights reserved.
//

#import "JKHTTPCursorPageObject.h"
#import "JKHTTPStandardPageObject.h"
#import <UIKit/UIKit.h>

@interface UIViewController (JKHTTPPages)
@property (nonatomic, strong, readonly) JKHTTPCursorPageObject *cursorPage;
@property (nonatomic, strong, readonly) JKHTTPStandardPageObject *standardPage;

@end
