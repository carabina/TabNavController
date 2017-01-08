//
//  KHViewController.m
//  TabNavController
//
//  Created by Keith Hon on 01/08/2017.
//  Copyright (c) 2017 Keith Hon. All rights reserved.
//

#import "KHViewController.h"
#import "TabNavController.h"

@interface KHViewController ()

@end

@implementation KHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

-(void) viewDidAppear:(BOOL)animated {
    
    UIViewController* oneVC = [[UIViewController alloc] init];
    [oneVC setTitle:@"oneVC"];
    
    UIViewController* twoVC = [[UIViewController alloc] init];
    [twoVC setTitle:@"twoVC"];
    
    UIViewController* threeVC = [[UIViewController alloc] init];
    [threeVC setTitle:@"threeVC"];
    
    UIViewController* fourVC = [[UIViewController alloc] init];
    [fourVC setTitle:@"fourVC"];
    
    UIViewController* fiveVC = [[UIViewController alloc] init];
    [fiveVC setTitle:@"fiveVC"];
    
    UIViewController* sixVC = [[UIViewController alloc] init];
    [sixVC setTitle:@"sixVC"];
    
    UIViewController* sevenVC = [[UIViewController alloc] init];
    [sevenVC setTitle:@"sevenVC"];
    
    TabNavController* tabController = [[TabNavController alloc] initWithRootViewController:oneVC];
    
    [tabController addViewController:twoVC withTabBarTitle:@"twoVC" image:[UIImage imageNamed:@"albumB_Capture.png"] clickedImage:[UIImage imageNamed:@"albumB_CaptureP.png"]];
    
    [tabController addViewController:threeVC withTabBarTitle:@"threeVC" image:[UIImage imageNamed:@"albumB_Setting.png"] clickedImage:[UIImage imageNamed:@"albumB_SettingP.png"]];
    
//    [tabController addViewController:fourVC withTabBarTitle:@"fourVC" image:[UIImage imageNamed:@"albumB_Setting.png"] clickedImage:[UIImage imageNamed:@"albumB_SettingP.png"]];
//    
//    [tabController addViewController:fiveVC withTabBarTitle:@"fiveVC" image:[UIImage imageNamed:@"albumB_Setting.png"] clickedImage:[UIImage imageNamed:@"albumB_SettingP.png"]];
//    
//    [tabController addViewController:sixVC withTabBarTitle:@"sixVC" image:[UIImage imageNamed:@"albumB_Setting.png"] clickedImage:[UIImage imageNamed:@"albumB_SettingP.png"]];
//    
//    [tabController addViewController:sevenVC withTabBarTitle:@"sevenVC" image:[UIImage imageNamed:@"albumB_Setting.png"] clickedImage:[UIImage imageNamed:@"albumB_SettingP.png"]];
    
    [self presentViewController:tabController animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
