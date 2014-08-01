//
//  ViewController.h
//  JSONNews
//
//  Created by Elias Haroun on 2014-07-07.
//  Copyright (c) 2014 Elias Haroun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, NSURLConnectionDataDelegate>

@property (strong, nonatomic) IBOutlet UITableView *newsTable;

@property NSArray *jsonArray;
@property NSMutableData *data;

@end
