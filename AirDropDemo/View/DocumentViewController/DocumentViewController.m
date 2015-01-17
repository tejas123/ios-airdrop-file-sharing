//
//  DocumentViewController.m
//  AirDropDemo
//
//  Created by Trupti on 03/01/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "DocumentViewController.h"

@interface DocumentViewController ()

@end

@implementation DocumentViewController

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL *url = [self generateFileURL:self.documentName];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}

- (NSURL *)generateFileURL:(NSString*)filename
{
    NSArray *fileComponents = [filename componentsSeparatedByString:@"."];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileComponents objectAtIndex:0] ofType:[fileComponents objectAtIndex:1]];

    return [NSURL fileURLWithPath:filePath];
}

- (IBAction)btnSharePress:(id)sender
{
    NSURL *url = [self generateFileURL:self.documentName];
    
    NSString *string = @"AirDrop File Sharing";
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[string, url] applicationActivities:nil];
    
    NSArray *excludedActivities = @[UIActivityTypePostToWeibo, UIActivityTypeAddToReadingList, UIActivityTypePostToFlickr, UIActivityTypePostToVimeo];
    activityViewController.excludedActivityTypes = excludedActivities;
    
    [self presentViewController:activityViewController animated:YES completion:^{ }];
}

@end