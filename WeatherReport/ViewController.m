//
//  ViewController.m
//  WeatherReport
//
//  Created by iHotra-LT-02 on 19/02/15.
//  Copyright (c) 2015 iHotra-LT-02. All rights reserved.
//

#import "ViewController.h"
#import "AddCitiesTableViewCell.h"
#import "ResultViewController.h"

@interface ViewController ()

@end

@implementation ViewController
int count=1;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tableview1.dataSource=self;
    self.tableview1.delegate=self;
    self.array =[[NSMutableArray alloc]init];
    self.tableview1.separatorColor =[UIColor blackColor];
    CALayer *btnLayer = [self.tableview1 layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
    self.tableview1.backgroundColor=[UIColor clearColor];
    
    NSUserDefaults *def =[NSUserDefaults standardUserDefaults];
  
    [self.array addObjectsFromArray:[def objectForKey:@"cityarray"]];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    
    UIButton * Button =[[UIButton alloc]init];
    Button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    Button.showsTouchWhenHighlighted = YES;
    Button.frame = CGRectMake(0.0, 0.0, 50, 30);
    [Button setTitle:@"ADD" forState:UIControlStateNormal];
    [Button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [Button addTarget:self action:@selector(addclick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:Button];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UILabel *title=[[UILabel alloc]initWithFrame:CGRectMake(0,5,70,20)];
    title.text=@"Add Your City";
    title.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=title;


    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
    
}


-(UIColor *)colorFromHexString:(NSString *)hexString
{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
    
}
-(void)addclick
{
    
    NSString *msg=@"Enter City Name";
    //custom popup setting
    UIView *popview=[[UIView alloc] initWithFrame:CGRectMake(0,0,200,200)];
    popview.backgroundColor=[self colorFromHexString:@"#ececec"];
    UILabel *lbl2=[[UILabel alloc] initWithFrame:CGRectMake(37,6,200,30)];
    lbl2.font=[UIFont fontWithName:@"oswald-regular" size:20.0f];
    lbl2.text=@"City Name";
    lbl2.textColor=[self colorFromHexString:@"#f3a64c"];
    lbl2.textAlignment=NSTextAlignmentCenter;
    [popview insertSubview:lbl2 atIndex:4];
    
    UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake(80,22,180,60)];
    lbl.font=[UIFont fontWithName:@"oswald-regular" size:12.0f];
    lbl.lineBreakMode=NSLineBreakByWordWrapping;
    lbl.numberOfLines=5;
    lbl.text=msg;
    lbl.textColor=[self colorFromHexString:@"#858585"];
    [popview insertSubview:lbl atIndex:5];
    
    _cityname=[[UITextField alloc] initWithFrame:CGRectMake(35,80,200,30)];
    _cityname.layer.borderWidth=0.5;
     _cityname.layer.cornerRadius=3;
     _cityname.font=[UIFont fontWithName:@"oswald-regular" size:18.0f];
     _cityname.delegate=self;
    [ _cityname setTextColor: [UIColor grayColor]];
     _cityname.textAlignment=NSTextAlignmentCenter;
    [ _cityname setPlaceholder:@"Enter City name"];
    
    [popview addSubview: _cityname];
    
    _getname=[[UIAlertView alloc] initWithTitle:nil message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Done", nil];
    [_getname setValue:popview forKey:@"accessoryView"];
    [_getname show];

    
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(alertView==_getname && buttonIndex==1)
    {
        NSString * string = [_cityname.text uppercaseString];
        
        
        if(string.length>0)
        {
            
           
            [self.array addObject:string];
            [self.tableview1 reloadData];
            

        }
        
                    NSUserDefaults *def =[NSUserDefaults standardUserDefaults];
                   [def setObject:self.array forKey:@"cityarray"];
                   [[NSUserDefaults standardUserDefaults]synchronize];
        
    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.array.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    CALayer *btnLayer = [cell layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
   
    cell.selectionStyle=UITableViewCellSelectionStyleNone;

    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.array objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath

{
    cell.backgroundColor =[UIColor brownColor];

    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    
    NSIndexPath *selectedIndexPath = [tableView indexPathForSelectedRow];
    ResultViewController *result =(ResultViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"result"];
        result.cityarray =[[NSMutableArray alloc]initWithArray:self.array];
      result.cityname1 = [self.array objectAtIndex:selectedIndexPath.row];
        [self.navigationController pushViewController:result animated:YES];
    
    
}
@end
