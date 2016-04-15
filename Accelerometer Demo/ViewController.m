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
@property (weak, nonatomic) IBOutlet UIButton *staticButton;
@property (weak, nonatomic) IBOutlet UILabel *staticLabel;
@property (weak, nonatomic) IBOutlet UIButton *dynamicStartButton;
@property (weak, nonatomic) IBOutlet UIButton *dynamicStopButton;
@property (weak, nonatomic) IBOutlet UILabel *dynamicLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.staticLabel.text = @"No data";
    self.dynamicLabel.text = @"No data";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)staticRequest:(id)sender {
}

- (IBAction)startDynamicRequest:(id)sender {
}

- (IBAction)stopDynamicRequest:(id)sender {
}

@end
