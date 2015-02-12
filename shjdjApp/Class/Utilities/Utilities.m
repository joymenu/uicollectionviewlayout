//
//  Utilities.m
//  shjdjApp
//
//  Created by bbu on 1/31/15.
//  Copyright (c) 2015 bbu. All rights reserved.
//

#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>


//UIColorUtilities
#import "UIColor+Expanded.h"
#import "UIColor+HSV.h"

#define CM_RELEASE(__POINTER) { if (__POINTER) { [__POINTER release]; __POINTER = nil; } }
#define CM_LOG_FRAME(__FRAME) { NSLog(@"frame -> x:%.0f | y:%.0f | w:%.0f | h:%.0f", __FRAME.origin.x, __FRAME.origin.y, __FRAME.size.width, __FRAME.size.height); }