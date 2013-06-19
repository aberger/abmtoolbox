//
//  DetailViewController.m
//  ABMToolbox
//
//  Created by Alex Berger on 6/19/13.
//  Copyright (c) 2013 aberger.me. All rights reserved.
//

#import "DetailViewController.h"


@interface DetailViewController ()

@end


@implementation DetailViewController

#pragma mark - view lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	NSURL *url = [NSURL URLWithString:@"http://aberger.me"];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	[_theWebView setScalesPageToFit:YES];
	[_theWebView loadRequest:request];
}

- (BOOL)webView:(UIWebView *)inWeb
shouldStartLoadWithRequest:(NSURLRequest *)inRequest
 navigationType:(UIWebViewNavigationType)inType
{
	if (inType == UIWebViewNavigationTypeLinkClicked) {
		[[UIApplication sharedApplication] openURL:[inRequest URL]];
		return NO;
	}
	return YES;
}

@end
