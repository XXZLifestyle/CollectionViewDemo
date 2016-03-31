//
//  XXZConstant.h
//  Author From Xavier Zachary
//
//  Created by Zachary on 14/10/29.
//  Copyright © 2015年 com.xxzing.future. All rights reserved.
//

#ifndef XXZConstant_h
#define XXZConstant_h

#pragma mark - Constants (宏 常量)

/* ***************************************************** */
#define SecondsOfDay            (24.f * 60.f * 60.f) //一天的秒数
#define Seconds(Days)           (24.f * 60.f * 60.f * (Days)) //秒数
#define MillisecondsOfDay       (24.f * 60.f * 60.f * 1000.f)(UL) //一天的毫秒数
#define Milliseconds(Days)      (24.f * 60.f * 60.f * 1000.f * (Days))(UL) //毫秒数

/* ***************************************************** */
#define XXZStatusBarHeight      (20.f) //状态栏
#define XXZTopBarHeight         (44.f) //导航条
#define XXZTabBarHeight         (49.f) //工具栏
#define XXZStatusAndNavHeight (XXZStatusBarHeight+XXZTopBarHeight)
#define XXZCellDefaultHeight   (44.f) //cell默认高度

//头视图高度
#define HeaderViewHeight_180 180*ratio
#define HeaderViewHeight_160 160*ratio
#define HeaderViewHeight_140 140*ratio
#define HeaderViewHeight_120 120*ratio

//键盘高度
#define XXZEnglishKeyboardHeight  (216.f)
#define XXZChineseKeyboardHeight  (252.f)

/* ***************************************************** */


#endif /* XXZConstant_h */