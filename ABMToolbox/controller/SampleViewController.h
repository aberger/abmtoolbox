//
//  SampleViewController.h
//  ABMToolbox
//
//  Created by Alex Berger on 6/14/13.
//  Copyright (c) 2013 aberger.me. All rights reserved.
//

#import "ABMGroupedTableViewHeader.h"

@interface SampleViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet ABMGroupedTableView *theTableView;

@property (nonatomic) NSArray *dataSource;
@property (nonatomic) NSArray *dataSource1;

@end
