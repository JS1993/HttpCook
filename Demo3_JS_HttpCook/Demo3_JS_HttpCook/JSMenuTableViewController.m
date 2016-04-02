//
//  JSMenuTableViewController.m
//  Demo3_JS_HttpCook
//
//  Created by  江苏 on 16/3/28.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSMenuTableViewController.h"
#import "JSJsonParser.h"
#import "JSMenu.h"
#import "JSStepTableViewController.h"
@interface JSMenuTableViewController ()
@property(nonatomic,strong)NSMutableArray* menus;
@end

@implementation JSMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.menus=[NSMutableArray array];
    NSString* path=[NSString stringWithFormat:@"http://apis.juhe.cn/cook/query?key=cae1e0967d353679792c1e12e7cd1845&menu=%@",self.menu];
    //URL包含中文时，必须转码
    path=[path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //创建url
    NSURL* url=[NSURL URLWithString:path];
    //创建请求
    NSMutableURLRequest* request=[NSMutableURLRequest requestWithURL:url];
    //发送消息
    NSURLSession* session=[NSURLSession sharedSession];
    NSURLSessionTask* task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        self.menus=[JSJsonParser parseMenuByJsonData:data];
        [self.tableView reloadData];
    }];
    //执行任务
    [task resume];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.menus.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    JSMenu* menu=self.menus[indexPath.row];
    cell.textLabel.text=menu.name;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData* imageData=[NSData dataWithContentsOfURL:[NSURL URLWithString:menu.imagePath]];
        UIImage* imagex=[UIImage imageWithData:imageData];
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.imageView.image=imagex;
            [cell setNeedsLayout];
        });
    });
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    JSMenu* m=self.menus[indexPath.row];
    NSLog(@"%lu",(unsigned long)m.steps.count);
    [self performSegueWithIdentifier:@"stepVC" sender:m];
}
// In a storyboard-based application, you will often want to do a little preparation before navigation

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    JSStepTableViewController *vc = segue.destinationViewController;
    vc.menu = sender;
}
@end
