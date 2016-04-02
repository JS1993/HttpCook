//
//  TableViewCell.h
//  Demo3_JS_HttpCook
//
//  Created by  江苏 on 16/3/28.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSStep.h"
@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *cellTV;
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
@property(strong,nonatomic)JSStep* steps;
@end
