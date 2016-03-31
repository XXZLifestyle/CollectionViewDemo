//
//  XXZCamera.m
//  Author From Xavier Zachary
//
//  Created by Zachary on 14/10/29.
//  Copyright © 2015年 com.xxzing.future. All rights reserved.
//

#import "XXZCamera.h"
#import <AVFoundation/AVFoundation.h>

@implementation XXZCamera

#pragma mark - 判断相机的权限
+ (NSInteger)isPermissionVisitCamera {
    NSInteger index = -2;
    
    NSString *mediaType = AVMediaTypeVideo;// Or AVMediaTypeAudio
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    
    if(authStatus ==AVAuthorizationStatusRestricted){//-1 受限制
        index = -1;
    }
    else if(authStatus == AVAuthorizationStatusDenied){//0 不允许访问
        index = 0;
    }
    else if(authStatus == AVAuthorizationStatusAuthorized){//1 允许访问
        index = 1;
    }
    else if(authStatus == AVAuthorizationStatusNotDetermined){//2 还没决定
        index = 2;
    }
    else {//-2 其他情况
        index = -2;
    }
    
    return index;
}

@end
