//
//  XXZColorClass.h
//  Author From Xavier Zachary
//
//  Created by Zachary on 14/10/29.
//  Copyright © 2015年 com.xxzd.future. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XXZUnitClass : NSObject

#pragma mark - 字符串的操作
/**
 *  字符串颜色转换成UIColor
 *
 *  @param string 颜色字符串
 *
 *  @return 颜色的对象; nil 参数错误
 */
+ (UIColor *)colorWithString:(NSString *)string;

/**
 *  判断字符串是否为空或并空格
 *
 *  @param string 字符串文本
 *
 *  @return NO 有内容; YES 没有内容或空格
 */
+ (BOOL)isBlankString:(NSString *)string;

/**
 *  对字符串进行操作
 *
 *  @param string       源字符串
 *  @param colorArr   UIColor
 *  @param fontArr    UIFont
 *  @param rangeArr  NSRange
 *
 *  @return 操作后的字符串, nil 则输入参数不对
 */
+ (NSAttributedString *)editWithString:(NSString *)string colorArray:(nullable NSArray *)colorArr fontArray:(nullable NSArray *)fontArr range:(NSArray *)rangeArr;

/**
 *  根据文本获取文本宽高
 *
 *  @param content      字符串文本
 *  @param fontFloat   内容的字体大小
 *  @param maxSize    最大宽高
 *
 *  @return CGSize, CGSizeZero 参数错误
 */
+ (CGSize)sizeWithText:(NSString *)content fontOfSize:(CGFloat)fontFloat maxSize:(CGSize)maxSize;

#pragma mark - 正则表达式
/**
 *  判断是否由数字和字母组成的字符串 & 单独由字母或数字组成的字符串
 *
 *  @param string 字符串文本
 *
 *  @return YES 符合条件, NO 不符合条件
 */
+ (BOOL)isAlphabetOrDigital:(NSString *)string;

/**
 *  判断是否全是数字组成的字符串
 *
 *  @param string 字符串文本
 *
 *  @return YES 符合条件, NO 不符合条件
 */
+ (BOOL)isDigital:(NSString *)string;

/**
 *  判断是否全是字母组成的字符串(不区分大小写)
 *
 *  @param string 字符串文本
 *
 *  @return YES 符合条件, NO 不符合条件
 */
+ (BOOL)isAlphabet:(NSString *)string;

/**
 *  判断是否全是中文组成的字符串
 *
 *  @param string 字符串文本
 *
 *  @return YES 符合条件, NO 不符合条件
 */
+ (BOOL)isAllChinese:(NSString *)string;

#pragma mark - 生成随机数
/**
 *  随机生成num个字母或数字组成的字符串(大写,小写或数字)
 *
 *  @param num 个数
 *
 *  @return 随机数num长度的字符串
 */
+ (NSString *)randomStringWithNumber:(NSInteger)num;

#pragma mark - 字符串排序
/**
 *  将中文字符串数组转换成中文拼音首字母字符串数组
 *
 *  @param array 全是中文字符串数组
 *  @param isUp  YES 大写, NO 小写
 *
 *  @return array中每个字符串中每个中文的首字母 组合成 拼音字符串的数组
 */
+ (NSMutableArray *)convertChineseStringToPinyinWithArray:(NSArray *)array uppercaseString:(BOOL)isUp;


/**
 *  将中文字符串转换成中文拼音首字母字符串
 *
 *  @param string 中文字符串
 *  @param isUp   YES 大写, NO 小写
 *
 *  @return 中文字符串中每个中文的首字母 组合成 中文拼音首字母字符串
 */
+ (NSString *)convertSingleChineseStringToPinyinWithString:(NSString *)string uppercaseString:(BOOL)isUp;

/**
 *  按字母或数字顺序排序
 *
 *  @param array       字母字符串数组
 *  @param isAscending YES 升序排列, NO 降序排列
 *
 *  @return 排完序的字符串数组
 */
+ (NSArray *)sortWithArray:(NSArray *)array orderAscending:(BOOL)isAscending;

#pragma mark - 未完待续


@end

NS_ASSUME_NONNULL_END
