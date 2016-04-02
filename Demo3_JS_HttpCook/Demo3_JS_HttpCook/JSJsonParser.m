//
//  JSJsonParser.m
//  Demo3_JS_HttpCook
//
//  Created by  江苏 on 16/3/28.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSJsonParser.h"
#import "JSMenu.h"
#import "JSStep.h"
@implementation JSJsonParser
+(NSMutableArray*)parseMenuByJsonData:(NSData*)data{
    NSMutableArray* menus=[NSMutableArray array];
    NSDictionary* dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSDictionary* resultDic=[dic objectForKey:@"result"];
    if ([resultDic isMemberOfClass:[NSNull class]]) {
        return menus;
    }
    NSArray* dataArr=[resultDic objectForKey:@"data"];
    for (NSDictionary* menudic in dataArr) {
        JSMenu* menu=[[JSMenu alloc]init];
        menu.name=[menudic objectForKey:@"title"];
        menu.imtro=[menudic objectForKey:@"imtro"];
        menu.imagePath=[[menudic objectForKey:@"albums"] lastObject];
        NSArray* stepArr=[menudic objectForKey:@"steps"];
        for (NSDictionary* stepDic in stepArr) {
            JSStep* step=[[JSStep alloc]init];
            step.info=[stepDic objectForKey:@"step"];
            step.imagePath=[stepDic objectForKey:@"img"];
            [menu.steps addObject:step];
        }
        [menus addObject:menu];
    }
    return menus;
}

@end

