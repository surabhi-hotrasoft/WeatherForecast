//
//  ViewController.h
//  WeatherReport
//
//  Created by iHotra-LT-02 on 19/02/15.
//  Copyright (c) 2015 iHotra-LT-02. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableview1;
@property (nonatomic,retain)NSMutableArray *array;
@property (nonatomic,retain)UITextField *cityname;
@property (strong, nonatomic)UIAlertView *getname;


@end
