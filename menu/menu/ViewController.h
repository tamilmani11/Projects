//
//  ViewController.h
//  menu
//
//  Created by BSA univ 13 on 29/01/14.
//  Copyright (c) 2014 BSA univ 13. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *toplayer;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic) CGFloat layerposition;
@property (nonatomic,strong) NSMutableArray *dataarray;
@end
