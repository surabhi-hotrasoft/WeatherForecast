//
//  ResultViewController.h
//  WeatherReport
//
//  Created by iHotra-LT-02 on 19/02/15.
//  Copyright (c) 2015 iHotra-LT-02. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultViewController : UIViewController
@property(nonatomic,retain)NSMutableArray *cityarray,*clouds,*deg,*dt,*humitity,*pressure,*snow,*speed,*day,*eve,*max,*min,*morn,*night,*description,*main;
@property(nonatomic,retain)NSMutableDictionary *snowdict;
@property (strong, nonatomic) IBOutlet UILabel *cloudlab;
@property (strong, nonatomic) IBOutlet UILabel *pressurelab;
@property (strong, nonatomic) IBOutlet UILabel *deglab;
@property (strong, nonatomic) IBOutlet UILabel *humilab;

@property (strong, nonatomic) IBOutlet UIButton *nextbut;
- (IBAction)nextclick:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *prevbut;
- (IBAction)prevclick:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *daylab;
@property (strong, nonatomic) IBOutlet UILabel *dayl;
@property (strong, nonatomic) IBOutlet UILabel *maxlab;
@property (strong, nonatomic) IBOutlet UILabel *mornlab;
@property (strong, nonatomic) IBOutlet UILabel *evelab;

@property (strong, nonatomic) IBOutlet UILabel *minlab;
@property (strong, nonatomic) IBOutlet UILabel *nightlab;
@property (strong, nonatomic) IBOutlet UILabel *desclab;
@property (strong, nonatomic) IBOutlet UILabel *mainlab;
@property(nonatomic,retain) NSString *cityname1;



@end
