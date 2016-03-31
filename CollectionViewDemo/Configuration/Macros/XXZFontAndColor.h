//
//  XXZFontAndColor.h
//  Author From Xavier Zachary
//
//  Created by Zachary on 14/10/29.
//  Copyright © 2015年 com.xxzing.future. All rights reserved.
//

#ifndef XXZFontAndColor_h
#define XXZFontAndColor_h

/* ***************************************************** */
//字体大小
#define FONT_BOLD_l0 [UIFont boldSystemFontOfSize:10*RATIO_WIDTH] //四级加粗标题
#define FONT_BOLD_l2 [UIFont boldSystemFontOfSize:12*RATIO_WIDTH] //三级加粗标题
#define FONT_BOLD_l4 [UIFont boldSystemFontOfSize:14*RATIO_WIDTH] //二级加粗标题
#define FONT_BOLD_l6 [UIFont boldSystemFontOfSize:16*RATIO_WIDTH] //一级加粗标题
#define FONT_BOLD_l8 [UIFont boldSystemFontOfSize:18*RATIO_WIDTH]
#define FONT_BOLD_20 [UIFont boldSystemFontOfSize:20*RATIO_WIDTH]

#define FONT_20 [UIFont systemFontOfSize:20*RATIO_WIDTH]
#define FONT_l8 [UIFont systemFontOfSize:18*RATIO_WIDTH]
#define FONT_l6 [UIFont systemFontOfSize:16*RATIO_WIDTH] //一级标题
#define FONT_l4 [UIFont systemFontOfSize:14*RATIO_WIDTH] //二级标题
#define FONT_l2 [UIFont systemFontOfSize:12*RATIO_WIDTH] //三级标题
#define FONT_l0 [UIFont systemFontOfSize:10*RATIO_WIDTH] //四级标题

/* ***************************************************** */
//颜色
#define UICOLOR_FROM_RGB(r, g, b)         [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define UICOLOR_FROM_RGBA(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define UICOLOR_FROM_YELLOW   [UIColor colorWithRed:0.988 green:0.710 blue:0.067 alpha:1.0]
#define UICOLOR_FROM_BACKGROUND [UIColor colorWithRed:0.945 green:0.953 blue:0.945 alpha:1.000]

#define WHITE_COLOR     [UIColor whiteColor]
#define BLACK_COLOR     [UIColor blackColor]


#endif /* XXZFontAndColor_h */
