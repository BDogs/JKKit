
//
//  JKKit.h
//  XS
//
//  Created by Futao on 16/3/30.
//  Copyright © 2016年 JKSoft. All rights reserved.
//

#ifndef JKKit_h
#define JKKit_h

#ifdef USE_JKKIT_CATEGORY
#import "UIController+JKNewThis.h"
#import "UINavigationController+JKPopPush.h"
#import "UView+JKNewThis.h"
#endif

#ifdef USE_JKKIT_HTTP
#import "JKHTTPObject.h"
#import "JKHTTPSessionManager.h"
#import "JKHTTPSessionManagerRequestSerializer.h"
#import "JKHTTPSessionManagerResponseSerializer.h"
#endif

#ifdef USE_JKKIT_MODEL
#import "JKHTTPModel.h"
#endif

#ifdef USE_JKKIT_VIEWMODEL
#import "JKHTTPViewModel.h"
#endif

#ifdef USE_JKKIT_PLUGINS
#import "JKModule.h"
#import "JKModuleManager.h"
#import "JKRouter.h"
#endif

#endif /* JKKit_h */
