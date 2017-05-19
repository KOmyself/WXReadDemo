//
//  WXCommonDefine.h
//  WXReadDemo
//
//  Created by 王晓 on 2017/5/18.
//  Copyright © 2017年 wangxiao. All rights reserved.
//

#ifndef WXCommonDefine_h
#define WXCommonDefine_h

//设备全屏宽度
#define SQFullScreenWidth      ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.width / [UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.width)
//设备全屏高度
#define SQFullScreenHeight     ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.height / [UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.height)

#define HEXRGBCOLOR(hex)        [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]
#define HEXRGBACOLOR(hex,a)     [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:a]

#endif
