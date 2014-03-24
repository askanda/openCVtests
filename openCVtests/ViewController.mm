//
//  ViewController.m
//  openCVtests
//
//  Created by Arunan on 3/22/14.
//  Copyright (c) 2014 CellScope. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello!" message:@"Welcome to OpenCV" delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
    
    [alert show];
    	// Do any additional setup after loading the view, typically from a nib.
    cv::Mat aMat;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
