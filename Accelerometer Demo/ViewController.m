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
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) CMMotionManager *coreMotionManager;

@property (assign, nonatomic) double x, y, z;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.staticLabel.text = @"No data";
    self.dynamicLabel.text = @"No data";
    
    self.staticButton.enabled = NO;
    self.dynamicStartButton.enabled = NO;
    self.dynamicStopButton.enabled = NO;
    
    self.x = 0.0;
    self.y = 0.0;
    self.z = 0.0;
    
    self.imageView.image = [UIImage imageNamed:@"dog.jpg"];
    
    self.coreMotionManager = [[CMMotionManager alloc] init];
    
    if (self.coreMotionManager.accelerometerAvailable) {
        self.staticButton.enabled = YES;
        self.dynamicStartButton.enabled = YES;
        [self.coreMotionManager startAccelerometerUpdates];
    } else {
        self.staticLabel.text = @"No Accelerometer Available";
        self.dynamicLabel.text = @"No Accelerometer Available";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)staticRequest:(id)sender {
    
    CMAccelerometerData *accelerometerData = self.coreMotionManager.accelerometerData;
    
    if (nil != accelerometerData) {
        CMAcceleration acceleration = accelerometerData.acceleration;
        self.staticLabel.text = [NSString stringWithFormat:@"x:%f\ny:%f\nz:%f", acceleration.x, acceleration.y, acceleration.z];
    }
}

- (IBAction)startDynamicRequest:(id)sender {
    
    self.dynamicStartButton.enabled = NO;
    self.dynamicStopButton.enabled = YES;
    
    self.coreMotionManager.accelerometerUpdateInterval = 0.01; // seconds
    
    ViewController * __weak weakSelf = self;
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [self.coreMotionManager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        // can do work here without blocking the UI
        
        double x = accelerometerData.acceleration.x;
        double y = accelerometerData.acceleration.y;
        double z = accelerometerData.acceleration.z;
        
        self.x = .9 * self.x + .1 * x;
        self.y = .9 * self.y + .1 * y;
        self.z = .9 * self.z + .1 * z;
        
        double rotation = -atan2(self.x, -self.y);
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // can update UI here
            
            weakSelf.imageView.transform = CGAffineTransformMakeRotation(rotation);
            
            weakSelf.dynamicLabel.text = [NSString stringWithFormat:@"x:%f\ny:%f\nz:%f", x, y, z];
        }];
    }];
}

- (IBAction)stopDynamicRequest:(id)sender {
    
    [self.coreMotionManager stopAccelerometerUpdates];
    self.dynamicStopButton.enabled = NO;
    self.dynamicStartButton.enabled = YES;
}

@end
