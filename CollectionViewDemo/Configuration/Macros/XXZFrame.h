//
//  XXZFrame.h
//  Author From Xavier Zachary
//
//  Created by Zachary on 14/10/29.
//  Copyright © 2015年 com.xxzing.future. All rights reserved.
//

#ifndef XXZFrame_h
#define XXZFrame_h

#pragma mark - Frame (宏 x, y, width, height)
/* ***************************************************** */
//当前屏幕的bound, width, height
#define SCREEN_BOUND        [[UIScreen mainScreen] bounds]
#define SCREEN_HEIGHT       [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH         [[UIScreen mainScreen] bounds].size.width
//当前屏幕宽高比
#define RATIO_HEIGHT SCREEN_HEIGHT/480
#define RATIO_WIDTH SCREEN_WIDTH/320

// View 坐标(x,y)和宽高(width,height)
#define X(v)                           (v).frame.origin.x
#define Y(v)                           (v).frame.origin.y
#define WIDTH(v)                 (v).frame.size.width
#define HEIGHT(v)               (v).frame.size.height

#define MinX(v)                 CGRectGetMinX((v).frame)
#define MinY(v)                 CGRectGetMinY((v).frame)

#define MidX(v)                 CGRectGetMidX((v).frame)
#define MidY(v)                 CGRectGetMidY((v).frame)

#define MaxX(v)                 CGRectGetMaxX((v).frame)
#define MaxY(v)                 CGRectGetMaxY((v).frame)


#define RECT_CHANGE_x(v,x)          CGRectMake(x, Y(v), WIDTH(v), HEIGHT(v))
#define RECT_CHANGE_y(v,y)          CGRectMake(X(v), y, WIDTH(v), HEIGHT(v))
#define RECT_CHANGE_point(v,x,y)    CGRectMake(x, y, WIDTH(v), HEIGHT(v))
#define RECT_CHANGE_width(v,w)      CGRectMake(X(v), Y(v), w, HEIGHT(v))
#define RECT_CHANGE_height(v,h)     CGRectMake(X(v), Y(v), WIDTH(v), h)
#define RECT_CHANGE_size(v,w,h)     CGRectMake(X(v), Y(v), w, h)

/* ***************************************************** */


#endif /* XXZFrame_h */
