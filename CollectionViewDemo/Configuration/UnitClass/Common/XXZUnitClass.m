//
//  XXZColorClass.m
//  Author From Xavier Zachary
//
//  Created by Zachary on 14/10/29.
//  Copyright © 2015年 com.xxzd.future. All rights reserved.
//

#import "XXZUnitClass.h"

@implementation XXZUnitClass

#pragma mark - 字符串操作
//字符串颜色转换成UIColor
+ (UIColor *)colorWithString:(NSString *)string {
    if (!string || [string isEqualToString:@""]) return nil;
    
    unsigned red,green,blue;
    NSRange range;
    
    range.length = 2;
    range.location = 1;
    [[NSScanner scannerWithString:[string substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[string substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[string substringWithRange:range]] scanHexInt:&blue];
    
    UIColor *color= [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1];
    return color;
}

//判断字符串为空和只为空格,返回YES,则为空或空格
+ (BOOL)isBlankString:(NSString *)string{
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
        return YES;
    }
    
    return NO;
}

//对字符串进行操作
//colorArr => UIColor, fontArr => UIFont, rangeArr => NSRange
+ (NSAttributedString *)editWithString:(NSString *)string colorArray:(NSArray *)colorArr fontArray:(NSArray *)fontArr range:(NSArray *)rangeArr{
    //若指定部分没有数据,返回nil
    if (!rangeArr.count) return nil;
    if (!colorArr.count && !fontArr.count) return nil;
    
    //初始化字符串
    NSMutableAttributedString *attributedText =[[NSMutableAttributedString alloc] initWithString:string];
    
    NSInteger colorCount = colorArr.count;
    NSInteger fontCount = fontArr.count;
    NSInteger rangeCount = rangeArr.count;
    
    //改变颜色
    if (colorCount && colorCount == rangeCount) {
        for (int i=0; i<rangeCount; i++) {
            
            /*
                //1 - 阴影
                NSShadow *shadow = [[NSShadow alloc] init];
                shadow.shadowColor = [UIColor cyanColor];
                shadow.shadowOffset = CGSizeMake(0, 5);
                shadow.shadowBlurRadius = 15.0;//阴影
             
                //NSShadowAttributeName:shadow
             */
            
            /*
                //2 - 删除线
                NSStrikethroughStyleAttributeName:[NSNumber numberWithInt:1],
                //NSUnderlineStyleNone
                NSStrikethroughColorAttributeName:[UIColor blackColor], //删除线颜色
             */
            
            /*
                //3 - 下划线
                NSUnderlineStyleAttributeName:[NSNumber numberWithInt:0x01],
                NSUnderlineColorAttributeName:[UIColor blackColor], //下划线颜色
             */
            
            /*
                //4 - 空心字
                NSStrokeWidthAttributeName:[NSNumber numberWithInt:3],
             */
            
            //颜色
            NSDictionary *attribute = @{
                                        NSForegroundColorAttributeName:[colorArr objectAtIndex:i]};
            //指定部分
            NSRange range = NSRangeFromString([rangeArr objectAtIndex:i]);
            //判断指定部分是否越界
            if (range.length > string.length || range.location+1 > string.length || (range.length+range.location > string.length)) {
                XXZLog(@"越界");
                return nil;
            }
            //change
            [attributedText addAttributes:attribute range:range];
        }
    }
    
    //改变字体
    if (fontCount && fontCount == rangeCount) {
        for (int i=0; i<rangeCount; i++) {
            //字体
            NSDictionary *attribute = @{NSFontAttributeName:[fontArr objectAtIndex:i]};
            //指定部分
            NSRange range = NSRangeFromString([rangeArr objectAtIndex:i]);
            //判断指定部分是否越界
            if (range.length > string.length || range.location+1 > string.length || (range.length+range.location > string.length)) {
                XXZLog(@"越界");
                return nil;
            }
            //change
            [attributedText addAttributes:attribute range:range];
        }
    }
    
    //其他
    
    
    return attributedText;
}

//获取文本宽高
+ (CGSize)sizeWithText:(NSString *)content fontOfSize:(CGFloat)fontFloat maxSize:(CGSize)maxSize{
    CGSize textSize = CGSizeZero;
    
    if (!content.length) return textSize;
    
    //必须条件:
    //• UILabel的属性 numberOfLines 行数改为0或-1等等,表示无限行
    //• 要设置UILabel的属性 UIFont和传入的fontFloat一致
    
    //1 - content指的是UILabel的text
    //2 - maxSize最大宽度和最大高度; 例如: CGSize fontFloat = CGSizeMake(200,MAXFLOAT);
    
    //3 - fontFloat字体大小属性值,与文本字体大小一致
    //字体要比之前设置的字体+1.5,才刚好适合
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontFloat]};
    
    //4.0 - 根据字体大小,内容多少,和自定义的最大宽度和高度
    //4.1 - 获取文本的高和宽
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        textSize = [content boundingRectWithSize:maxSize  options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:attribute context:nil].size;
    }else{
//        textSize = [content sizeWithFont: [UIFont systemFontOfSize:fontFloat] constrainedToSize:maxSize lineBreakMode:UILineBreakModeWordWrap];
        XXZLog(@"不支持iOS 7.0 以下的系统..");
    }
    
    return textSize;
}

#pragma mark - 正则表达式
//匹配count个由字母/数字组成的字符串的正则表达式：
//也可以是单独由字母或数字组成的字符串
+ (BOOL)isAlphabetOrDigital:(NSString *)string {
    NSInteger count = string.length;
    if (!count) return NO;
    
    NSString *regex = [NSString stringWithFormat: @"^[A-Za-z0-9]{0,%d}$", count];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    if ([predicate evaluateWithObject:string]){//匹配
        return YES;
    }
    
    return NO;
}

//匹配count个,是不是数字
+ (BOOL)isDigital:(NSString *)string {
    NSInteger count = string.length;
    if (!count) return NO;
    
    NSString *regex = [NSString stringWithFormat: @"^[0-9]{0,%d}$", count];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    if ([predicate evaluateWithObject:string]){//匹配
        return YES;
    }
    
    return NO;
}

//匹配count个,是不是字母
+ (BOOL)isAlphabet:(NSString *)string {
    NSInteger count = string.length;
    if (!count) return NO;
    
    NSString *regex = [NSString stringWithFormat:@"^[A-Za-z]{0,%d}$", count];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    if ([predicate evaluateWithObject:string]){//匹配
        return YES;
    }
    
    return NO;
}

//判断都是中文, 返回YES 是中文
+ (BOOL)isAllChinese:(NSString *)string {
    if (!string.length) return NO;
    
    BOOL flag = YES; //默认全是中文组成的字符串
    
    for(int i=0; i< [string length];i++){
        int a = [string characterAtIndex:i];
        
        if(!(a > 0x4e00 && a < 0x9fff)) {
            flag = NO;
        }
        
        if (i+1 == string.length) {//循环完毕
            if (flag) {//全是中文组成的字符串
                return YES;
            }
        }
    }
    
    return NO;
}

#pragma mark - 生成随机数
//随机生成num个字母或数字
/*
    通过arc4random()
    1 - 获取0到x-1之间的整数的代码如下：
        int value = arc4random() % x;
 
    2 - 获取1到x之间的整数的代码如下:
        int value = (arc4random() % x) + 1;
 */
+ (NSString *)randomStringWithNumber:(NSInteger)num{
    if (num < 0) return nil;
    
    char data[num];
    int type = arc4random()%3;
    
    if (type == 0) {
        for (int x=0;x<num;data[x++] = (char)('0' + (arc4random_uniform(10))));
    }
    else  if (type == 1) {
        for (int x=0;x<num;data[x++] = (char)('a' + (arc4random_uniform(26))));
    }
    else if (type == 2) {
        for (int x=0;x<num;data[x++] = (char)('A' + (arc4random_uniform(26))));
    }
    
    return [[NSString alloc] initWithBytes:data length:num encoding:NSUTF8StringEncoding];
}

#pragma mark - 字符串排序
//将单个中文字符串转换成中文拼音首字母字符串
//isUp = YES 大写, NO 小写
+ (NSString *)convertSingleChineseStringToPinyinWithString:(NSString *)string uppercaseString:(BOOL)isUp {
    if (!string.length) return nil;
        
    NSString *needStr = nil;
    for (int i=0; i<string.length; i++) {
        //截取一个中文
        NSString *singleStr = [string substringWithRange:NSMakeRange(i, 1)];
        //转成了可变字符串
        NSMutableString *str = [NSMutableString stringWithString:singleStr];
        //先转换为带声调的拼音
        CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
        //再转换为不带声调的拼音
        CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
        
        //转化为大写拼音
        NSString *pinYin = nil;
        if (isUp) {
            pinYin = [str capitalizedString];
        }else {
            pinYin = [str lowercaseString];
        }
        
        //截取每个中文的首字母
        if (needStr.length) {
            needStr = [needStr stringByAppendingFormat:@"%@", [pinYin substringToIndex:1]];
        }else {
            needStr = [pinYin substringToIndex:1];
        }
    }
    
    return needStr;
}

//将中文字符串数组转换成中文拼音首字母字符串数组
+ (NSMutableArray *)convertChineseStringToPinyinWithArray:(NSArray *)array uppercaseString:(BOOL)isUp {
    if (!array.count) return nil;
    NSMutableArray *needArr = [NSMutableArray array];
    
    for (NSString *aString in array) {
        
        NSString *needStr = nil;
        for (int i=0; i<aString.length; i++) {
            //截取一个中文
            NSString *singleStr = [aString substringWithRange:NSMakeRange(i, 1)];
            //转成了可变字符串
            NSMutableString *str = [NSMutableString stringWithString:singleStr];
            //先转换为带声调的拼音
            CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
            //再转换为不带声调的拼音
            CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
            
            //转化为大写拼音
            NSString *pinYin = nil;
            if (isUp) {
                pinYin = [str capitalizedString];
            }else {
                pinYin = [str lowercaseString];
            }
            
            //截取每个中文的首字母
            if (needStr.length) {
                needStr = [needStr stringByAppendingFormat:@"%@", [pinYin substringToIndex:1]];
            }else {
                needStr = [pinYin substringToIndex:1];
            }
        }
        
        //字符串中每个中文的首字母 组合成 拼音字符串 加到数组中
        [needArr addObject:needStr];
    }
    
    return needArr;
}

//按字母或数字顺序排序
+ (NSArray *)sortWithArray:(NSArray *)array orderAscending:(BOOL)isAscending{
    if (!array.count) return nil;
    
    NSArray *sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        if (isAscending) {
            return [obj1 compare:obj2 options:NSNumericSearch];//升序
        }else {
            return [obj2 compare:obj1 options:NSNumericSearch];//降序
        }
    }];
    
    return sortedArray;
}

#pragma mark - 未完待续


@end
