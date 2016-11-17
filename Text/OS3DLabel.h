//
//  OS3DLabel.h
//  Text
//
//  Created by xu jie on 2016/11/17.
//  Copyright © 2016年 xujie. All rights reserved.
//

#import <SceneKit/SceneKit.h>

@interface OS3DLabel : SCNView
@property(nonatomic, strong)UIColor *textColor;      // 文字颜色
@property(nonatomic, assign) id contents;  // 设置内容填充
@property(nonatomic, assign)float  fontSize;         // 文字大小
@property(nonatomic, copy)NSString  *text;           // 文字内容
@property(nonatomic, assign)float  depth;            // 文字深度
@property(nonatomic, copy) NSString *alignmentMode;  // 文字对其方式
@property(nonatomic, copy) NSString *truncationMode; // 尾部省略,单行显示的是否其作用
@property(nonatomic, assign)SCNVector4 rotation;      // 文字旋转角度
@property(nonatomic, assign)BOOL isSingle;            // 是否单行显示
@property(nonatomic, assign)BOOL allowsControl;

@end
