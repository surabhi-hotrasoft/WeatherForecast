//
//  ResultViewController.m
//  WeatherReport
//
//  Created by iHotra-LT-02 on 19/02/15.
//  Copyright (c) 2015 iHotra-LT-02. All rights reserved.
//

#import "ResultViewController.h"
#import "AFNetworking.h"

@interface ResultViewController ()

@end

@implementation ResultViewController
int count1 =0;
int counter = 0;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"city array %@",self.cityarray);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated
{
    counter=0;
    UILabel *title=[[UILabel alloc]initWithFrame:CGRectMake(0,5,70,20)];
    title.text=self.cityname1;
    title.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=title;
    self.navigationController.navigationBar.backItem.title=@"Back";
    self.navigationController.navigationBar.tintColor = [UIColor blueColor];

    [self getweather];
    
}


//get weather through api
-(void)getweather
{
    
    UIActivityIndicatorView *wait=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    wait.color=[self colorFromHexString:@"#bfdecc"];
    UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake(105,4,150,20)];
    lbl.text=@"Loading...";
    lbl.font=[UIFont fontWithName:@"oswald-regular" size:15.0f];
    lbl.textColor=[self colorFromHexString:@"#bfdecc"];
    UIView *v=[[UIView alloc] initWithFrame:CGRectMake(0,0,100,80)];
    [v addSubview:wait];
    [v addSubview:lbl];
    wait.frame=CGRectMake(120,40,30,30);
    v.backgroundColor=[self colorFromHexString:@"#636467"];
    UIAlertView *waitale=[[UIAlertView alloc] initWithTitle:nil message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    [wait startAnimating];
    [waitale setValue:v forKey:@"accessoryView"];
    [waitale show];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString * string = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily?q=%@&cnt=14&APPID=889a408de2754c6350a13a6a382c8797",self.cityname1];
    string = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager GET: string parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *data =[responseObject valueForKeyPath:@"list"];
     
        NSLog(@"response data %@",responseObject);
        self.clouds=[[NSMutableArray alloc]init];
          self.deg=[[NSMutableArray alloc]init];
          self.dt=[[NSMutableArray alloc]init];
          self.humitity=[[NSMutableArray alloc]init];
          self.pressure=[[NSMutableArray alloc]init];
          self.snow=[[NSMutableArray alloc]init];
          self.speed=[[NSMutableArray alloc]init];
          self.day=[[NSMutableArray alloc]init];
          self.eve=[[NSMutableArray alloc]init];
          self.max=[[NSMutableArray alloc]init];
          self.min=[[NSMutableArray alloc]init];
          self.morn=[[NSMutableArray alloc]init];
          self.night=[[NSMutableArray alloc]init];
        self.snowdict =[[NSMutableDictionary alloc]init];
        self.description =[[NSMutableArray alloc]init];
        self.main =[[NSMutableArray alloc]init];
        for(int i=0;i<data.count;i++)
        {
        
            NSDictionary *dic = [data objectAtIndex:i];
            [self.clouds addObject:[dic objectForKey:@"clouds"]];
            [self.deg addObject:[dic objectForKey:@"deg"]];
            [self.dt addObject:[dic objectForKey:@"dt"]];
            [self.humitity addObject:[dic objectForKey:@"humidity"]];
            [self.pressure addObject:[dic objectForKey:@"pressure"]];
            if([dic objectForKey:@"snow"]!=nil)
            {
            [self.snow addObject:[dic objectForKey:@"snow"]];
            
            [self.snowdict setValue:[dic objectForKey:@"snow"] forKey:[NSString stringWithFormat:@"%d",i+1]];
            }
            [self.speed addObject:[dic objectForKey:@"speed"]];
            NSDictionary *dict =[dic objectForKey:@"temp"];
            [self.day addObject:[dict objectForKey:@"day"]];
            [self.eve addObject:[dict objectForKey:@"eve"]];
            [self.max addObject:[dict objectForKey:@"max"]];
            [self.min addObject:[dict objectForKey:@"min"]];
            [self.morn addObject:[dict objectForKey:@"morn"]];
            [self.night addObject:[dict objectForKey:@"night"]];
            NSMutableArray *arr =[[NSMutableArray alloc]init];
            arr =[dic objectForKey:@"weather"];
          for(  NSDictionary *weat in arr)
          {
              [self.description addObject:[weat objectForKey:@"description"]];
              [self.main addObject:[weat objectForKey:@"main"]];
              
          }
            
        }
    
        count1=0;
        self.cloudlab.text =[NSString stringWithFormat:@"%@",[self.clouds objectAtIndex:0]];
        self.deglab.text =[NSString stringWithFormat:@"%@",[self.deg objectAtIndex:count1]];
        self.humilab.text =[NSString stringWithFormat:@"%@",[self.humitity objectAtIndex:count1]];
        self.pressurelab.text =[NSString stringWithFormat:@"%@",[self.pressure objectAtIndex:count1]];
        self.daylab.text =[NSString stringWithFormat:@"Day %d",count1+1];
        self.dayl.text =[NSString stringWithFormat:@"%@",[self.day objectAtIndex:count1]];
        self.evelab.text =[NSString stringWithFormat:@"%@",[self.eve objectAtIndex:count1]];
        self.mornlab.text =[NSString stringWithFormat:@"%@",[self.morn objectAtIndex:count1]];
        self.nightlab.text=[NSString stringWithFormat:@"%@",[self.night objectAtIndex:count1]];
        self.desclab.text =[NSString stringWithFormat:@"%@",[self.description objectAtIndex:count1]];
        self.mainlab.text=[NSString stringWithFormat:@"%@",[self.main objectAtIndex:count1]];
        self.minlab.text=[NSString stringWithFormat:@"%@",[self.min objectAtIndex:count1]];
        self.maxlab.text=[NSString stringWithFormat:@"%@",[self.max objectAtIndex:count1]];
        [waitale dismissWithClickedButtonIndex:0 animated:YES];
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
       
         [waitale dismissWithClickedButtonIndex:0 animated:YES];
         
     }];

}

//colour setting
-(UIColor *)colorFromHexString:(NSString *)hexString
{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//next day data
- (IBAction)nextclick:(id)sender {
    if(count1<13)
    {

    count1++;
    self.cloudlab.text =[NSString stringWithFormat:@"%@",[self.clouds objectAtIndex:count1]];
    self.daylab.text =[NSString stringWithFormat:@"Day %d",count1+1];
        self.deglab.text =[NSString stringWithFormat:@"%@",[self.deg objectAtIndex:count1]];
        self.humilab.text =[NSString stringWithFormat:@"%@",[self.humitity objectAtIndex:count1]];
        self.pressurelab.text =[NSString stringWithFormat:@"%@",[self.pressure objectAtIndex:count1]];
        self.dayl.text =[NSString stringWithFormat:@"%@",[self.day objectAtIndex:count1]];
        self.evelab.text =[NSString stringWithFormat:@"%@",[self.eve objectAtIndex:count1]];
        self.mornlab.text =[NSString stringWithFormat:@"%@",[self.morn objectAtIndex:count1]];
        self.nightlab.text=[NSString stringWithFormat:@"%@",[self.night objectAtIndex:count1]];
        self.desclab.text =[NSString stringWithFormat:@"%@",[self.description objectAtIndex:count1]];
        self.mainlab.text=[NSString stringWithFormat:@"%@",[self.main objectAtIndex:count1]];
        self.minlab.text=[NSString stringWithFormat:@"%@",[self.min objectAtIndex:count1]];
        self.maxlab.text=[NSString stringWithFormat:@"%@",[self.max objectAtIndex:count1]];
    }
    
    else
    {
        
        UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"No data found" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [view show];
        self.daylab.text =[NSString stringWithFormat:@"Day %d",count1+1];
    }

}

//previous day data click
- (IBAction)prevclick:(id)sender {
   
    if(count1>0)
    {
     count1--;
    self.cloudlab.text =[NSString stringWithFormat:@"%@",[self.clouds objectAtIndex:count1]];
    self.daylab.text =[NSString stringWithFormat:@"Day %d",count1+1];
        
        self.deglab.text =[NSString stringWithFormat:@"%@",[self.deg objectAtIndex:count1]];
        self.humilab.text =[NSString stringWithFormat:@"%@",[self.humitity objectAtIndex:count1]];
        self.pressurelab.text =[NSString stringWithFormat:@"%@",[self.pressure objectAtIndex:count1]];
        self.dayl.text =[NSString stringWithFormat:@"%@",[self.day objectAtIndex:count1]];
        self.evelab.text =[NSString stringWithFormat:@"%@",[self.eve objectAtIndex:count1]];
        self.mornlab.text =[NSString stringWithFormat:@"%@",[self.morn objectAtIndex:count1]];
        self.nightlab.text=[NSString stringWithFormat:@"%@",[self.night objectAtIndex:count1]];
        self.desclab.text =[NSString stringWithFormat:@"%@",[self.description objectAtIndex:count1]];
        self.mainlab.text=[NSString stringWithFormat:@"%@",[self.main objectAtIndex:count1]];
        self.minlab.text=[NSString stringWithFormat:@"%@",[self.min objectAtIndex:count1]];
        self.maxlab.text=[NSString stringWithFormat:@"%@",[self.max objectAtIndex:count1]];
    }
    else
    {
        
        UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"No data found" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [view show];
          self.daylab.text =[NSString stringWithFormat:@"Day %d",count1+1];
    }
}
@end
