//
//  TableViewCell.m
//  Demo3_JS_HttpCook
//
//  Created by  江苏 on 16/3/28.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell
-(void)layoutSubviews{
    [super layoutSubviews];
    self.cellTV.text=self.steps.info;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData* imageData=[NSData dataWithContentsOfURL:[NSURL URLWithString:self.steps.imagePath]];
        UIImage* imagec=[UIImage imageWithData:imageData];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.cellImage.image=imagec;
        });
    });
}
@end
