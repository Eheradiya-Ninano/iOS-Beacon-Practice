//
//  ViewController.m
//  BeaconPractice
//
//  Created by WooKyun Jeon on 2015. 2. 4..
//  Copyright (c) 2015년 WooKyun Jeon. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize buttonServiceStart, buttonServiceStop;
@synthesize labelGreenBeacon, labelOrangeBeacon, labelPinkBeacon;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark IBAction

- (IBAction)clickedServiceStartButton:(id)sender {
    
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appdelegate startBackgroundMornitoring:self];
}

- (IBAction)clickedServiceStopButton:(id)sender {
    
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appdelegate stopBackgroundMornitoring];
}

#pragma mark - 
#pragma mark BeaconDelegate

- (void)enterBeaconRegion:(NSString *)proximityUUID {
    //    b0c1861c-b275-11e4-a71e-12e3f512a338  Beacon_Pink
    //    b0c188ce-b275-11e4-a71e-12e3f512a338  Beacon_Orange
    //    b0c18a18-b275-11e4-a71e-12e3f512a338  Beacon_Green
    
    if ([proximityUUID isEqual:@"b0c1861c-b275-11e4-a71e-12e3f512a338"]) {
        [labelPinkBeacon setBackgroundColor:[UIColor redColor]];
    } else if ([proximityUUID isEqual:@"b0c188ce-b275-11e4-a71e-12e3f512a338"]) {
        [labelOrangeBeacon setBackgroundColor:[UIColor orangeColor]];
    } else if ([proximityUUID isEqual:@"b0c18a18-b275-11e4-a71e-12e3f512a338"]) {
        [labelGreenBeacon setBackgroundColor:[UIColor greenColor]];
    }
}

- (void)exitBeaconRegion:(NSString *)proximityUUID {
    
    if ([proximityUUID isEqual:@"b0c1861c-b275-11e4-a71e-12e3f512a338"]) {
        [labelPinkBeacon setBackgroundColor:[UIColor grayColor]];
    } else if ([proximityUUID isEqual:@"b0c188ce-b275-11e4-a71e-12e3f512a338"]) {
        [labelOrangeBeacon setBackgroundColor:[UIColor grayColor]];
    } else if ([proximityUUID isEqual:@"b0c18a18-b275-11e4-a71e-12e3f512a338"]) {
        [labelGreenBeacon setBackgroundColor:[UIColor grayColor]];
    }
}

@end
