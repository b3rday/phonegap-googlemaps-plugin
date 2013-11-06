//
//  GoogleMapsViewController.m
//  SimpleMap
//
//  Created by masashi on 11/6/13.
//
//

#import "GoogleMapsViewController.h"

@interface GoogleMapsViewController ()

@end

@implementation GoogleMapsViewController


- (void)loadView {
  [super loadView];
  
  CGRect screenSize = [[UIScreen mainScreen] bounds];
  CGRect pluginRect = CGRectMake(screenSize.size.width * 0.05, screenSize.size.height * 0.05, screenSize.size.width * 0.9, screenSize.size.height * 0.9);
  [self.view setFrame:pluginRect];
  self.view.backgroundColor = [UIColor lightGrayColor];
  
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    //------------------
    // Create a map view
    //------------------
    [GMSServices provideAPIKey:@"AIzaSyADns99mO62aBapBN4_cnCJQnYdh-j6-ug"];
  
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:0
                                longitude:0
                                zoom:0];
    CGRect pluginRect = self.view.frame;
    CGRect mapRect = CGRectMake(pluginRect.size.width * 0.05, pluginRect.size.height * 0.05, pluginRect.size.width * 0.9, pluginRect.size.height * 0.9 - 30);
    self.map = [GMSMapView mapWithFrame:mapRect camera:camera];
    self.map.delegate = self;
    [self.view addSubview: self.map];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - GMSMapViewDelegate

- (void)mapView:(GMSMapView *)mapView
    didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
  
  NSString* jsString = [NSString stringWithFormat:@"plugin.google.maps.Map._onMapClick(\"%f,%f\");", coordinate.latitude, coordinate.longitude];
  [self.webView stringByEvaluatingJavaScriptFromString:jsString];
}

@end