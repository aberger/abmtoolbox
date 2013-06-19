//
//  ModalViewController.h
//  ABMToolbox
//
//  Created by Alex Berger on 6/19/13.
//  Copyright (c) 2013 aberger.me. All rights reserved.
//

#import "ABMPlainTableViewHeader.h"

@interface ModalViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet ABMPlainTableView *theTableView;

@property (nonatomic) NSArray *dataSource;

@end
