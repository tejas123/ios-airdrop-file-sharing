//
//  DocumentViewController.h
//  AirDropDemo
//
//  Created by Trupti on 03/01/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DocumentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property NSString *documentName;

@end