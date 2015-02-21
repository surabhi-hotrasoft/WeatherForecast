//
//  StartViewController.m
//  WeatherReport
//
//  Created by iHotra-LT-02 on 21/02/15.
//  Copyright (c) 2015 iHotra-LT-02. All rights reserved.
//

#import "StartViewController.h"
#import "ViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

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
    UIImageView *logo = [[UIImageView alloc]init];
    logo.frame = CGRectMake(0, 30,320, 180);
    logo.image = [UIImage imageNamed:@"weatherimg"];
    
    [self.view addSubview:logo];
    
    [UIView animateWithDuration:2.0 animations:^{
        logo.transform = CGAffineTransformMakeScale(0.5, 0.5);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             logo.transform = CGAffineTransformMakeScale(1, 1);
                         }];
                     }];


    UIImageView *logo1 = [[UIImageView alloc]init];
    logo1.frame = CGRectMake(0, 200,320, 200);
    logo1.image = [UIImage imageNamed:@"weather"];
    
    [self.view addSubview:logo1];
    
    [UIView animateWithDuration:2.0 animations:^{
        logo1.transform = CGAffineTransformMakeScale(0.5, 0.5);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             logo1.transform = CGAffineTransformMakeScale(1, 1);
                         }];
                     }];
    
    UIImageView *logo2 = [[UIImageView alloc]init];
    logo2.frame = CGRectMake(0, 400,320, 170);
    logo2.image = [UIImage imageNamed:@"weatherimages"];
    
    [self.view addSubview:logo2];
    
    [UIView animateWithDuration:2.0 animations:^{
        logo2.transform = CGAffineTransformMakeScale(0.5, 0.5);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             logo2.transform = CGAffineTransformMakeScale(1, 1);
                         }];
                     }];


}

-(void)viewDidAppear:(BOOL)animated
{
    
    
    UIButton * Button =[[UIButton alloc]init];
    Button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    Button.showsTouchWhenHighlighted = YES;
    Button.frame = CGRectMake(0.0, 0.0, 50, 30);
    [Button setTitle:@"NEXT" forState:UIControlStateNormal];
    [Button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [Button addTarget:self action:@selector(buttonclick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:Button];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UILabel *title=[[UILabel alloc]initWithFrame:CGRectMake(0,5,70,20)];
    title.text=@"WELCOME";
    title.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=title;
    
    
    self.navigationController.navigationBar.barTintColor=[UIColor blackColor];
  }

-(void)buttonclick
{
    ViewController *viewc = (ViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"viewc"];
    [self.navigationController pushViewController:viewc animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
