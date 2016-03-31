//
//  XXZCamera.h
//  Author From Xavier Zachary
//
//  Created by Zachary on 14/10/29.
//  Copyright © 2015年 com.xxzing.future. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_CLASS_AVAILABLE_IOS(7_0) @interface XXZCamera : NSObject

/**
 *  判断相机的权限
 *
 *  @return -2 其他情况, -1 受限制, 0 不允许, 1 允许, 2 暂未决定
 */
+ (NSInteger)isPermissionVisitCamera;

@end
