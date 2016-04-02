//
//  JSMenu.h
//  Demo3_JS_HttpCook
//
//  Created by  江苏 on 16/3/28.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSMenu : NSObject
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* imtro;
@property(nonatomic,copy)NSString* imagePath;
@property(nonatomic,strong)NSMutableArray* steps;
@end
