//
//  ViewController.m
//  Accelerometer Demo
//
//  Created by Sebastián Badea on 14/4/16.
//  Copyright © 2016 Sebastian Badea. All rights reserved.
//

@import CoreMotion;
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *staticLabel;
@property (weak, nonatomic) IBOutlet UILabel *dynamicLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
