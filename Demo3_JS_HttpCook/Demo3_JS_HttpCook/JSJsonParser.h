//
//  JSJsonParser.h
//  Demo3_JS_HttpCook
//
//  Created by  江苏 on 16/3/28.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSJsonParser : NSObject
+(NSMutableArray*)parseMenuByJsonData:(NSData*)data;
@end
