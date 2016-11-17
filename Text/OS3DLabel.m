//
//  OS3DLabel.m
//  Text
//
//  Created by xu jie on 2016/11/17.
//  Copyright © 2016年 xujie. All rights reserved.
//

#import "OS3DLabel.h"
#import <SceneKit/SceneKit.h>
@interface OS3DLabel()
@property(nonatomic,strong)SCNText *scnText;
@property(nonatomic,strong)SCNScene *textScene;
@property(nonatomic,strong)SCNNode *textNode;
@property(nonatomic,strong)SCNNode *cameraNode;
@property(nonatomic,strong)SCNNode *directlightNode;
@end

@implementation OS3DLabel

//-----------------------------------------------------------
#pragma mark -
#pragma mark - 懒加载一个SCNText 对象
//
//-----------------------------------------------------------
-(SCNText *)scnText{
    if (!_scnText){
        _scnText = [[SCNText alloc]init];
        self.scnText.wrapped = YES;
        _scnText.alignmentMode =  kCAAlignmentLeft;
        _scnText.truncationMode = kCATruncationEnd;
         self.textNode.geometry = _scnText;
        [self.textScene.rootNode addChildNode:self.textNode];
        [self.textScene.rootNode addChildNode:self.cameraNode];
        [self.textScene.rootNode addChildNode:self.directlightNode];
    }
    return _scnText;
}

-(SCNScene *)textScene{
    if(!_textScene){
        _textScene = [SCNScene scene];
        self.scene = _textScene;
    }
    return _textScene;
}

-(SCNNode *)textNode{
    if (!_textNode){
        _textNode = [SCNNode node];
        _textNode.rotation = SCNVector4Make(1, 0, 0, M_PI/20);
    }
    return _textNode;
}

-(SCNNode *)cameraNode{
    if (!_cameraNode){
        _cameraNode = [SCNNode node];
        _cameraNode.camera = [SCNCamera camera];
        _cameraNode.camera.automaticallyAdjustsZRange = YES;
        _cameraNode.position = SCNVector3Make(0, 0, 5);
    }
    return _cameraNode;
}

-(SCNNode *)directlightNode{
    if (!_directlightNode){
        _directlightNode = [SCNNode node];
        _directlightNode.light = [SCNLight light];
        _directlightNode.light.type = SCNLightTypeDirectional;
    }
    return _directlightNode;
}






/// 设置文字属性
-(void)setText:(NSString *)text{
    _text = text;
    if (self.fontSize == 0){
        self.fontSize = 0.1;
    }
    self.scnText.string = text;
    [self updateSCNTextContrinerFrame];
    
    
}
-(void)setFontSize:(float)fontSize{
    _fontSize = fontSize;
    [self updateSCNTextContrinerFrame];
   
    
}

-(void)updateSCNTextContrinerFrame{
    self.scnText.font = [UIFont systemFontOfSize:self.fontSize];
    CGFloat maxheight = self.isSingle ? self.fontSize: 5.0;
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(5*self.bounds.size.width/self.bounds.size.height, maxheight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:self.fontSize]} context:nil].size;
    size.height += self.fontSize*0.2;
    self.scnText.containerFrame = CGRectMake(-size.width/2.0, -size.height/2.0, size.width, size.height);
}


-(void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
   self.scnText.firstMaterial.diffuse.contents = textColor;
}

-(void)setDepth:(float)depth{
    self.scnText.extrusionDepth = depth;
}

-(void)setRotation:(SCNVector4)rotation{
    _rotation = rotation;
    _textNode.rotation = rotation;
}

-(void)setIsSingle:(BOOL)isSingle{
    _isSingle = isSingle;
    self.scnText.wrapped = !isSingle;
}

-(void)setAlignmentMode:(NSString *)alignmentMode{
    self.scnText.alignmentMode = alignmentMode;
}

-(void)setTruncationMode:(NSString *)truncationMode{
    _truncationMode = truncationMode;
    self.scnText.truncationMode = truncationMode;
}

-(void)setAllowsControl:(BOOL)allowsControl{
    _allowsControl = allowsControl;
    self.allowsCameraControl = allowsControl;
}

- (void)setContents:(id)contents{
    _contents = contents;
    self.textNode.geometry.firstMaterial.diffuse.contents = contents;
}






@end
