//
//  XXZUnit.h
//  Author From Xavier Zachary
//
//  Created by Zachary on 14/10/29.
//  Copyright © 2015年 com.xxzing.future. All rights reserved.
//

#ifndef XXZUnit_h
#define XXZUnit_h

/*导入头文件* *******************************/
#import "XXZUnitClass.h"
#import "XXZCamera.h"

/*类方法, 宏定义* ****************************/

//十六进制颜色 => UIColor
#define UICOLOR_FROM(string) [XXZUnitClass colorWithString:string]
//判断字符串是否为空或并空格
#define IS_BLANK_STRING(string) [XXZUnitClass isBlankString:string]
//判断相机的权限
#define CAMERA_AUTHORIZATION_STATUS [XXZCamera isPermissionVisitCamera]

/*其他* ********************/


#endif /* Unit_h */
