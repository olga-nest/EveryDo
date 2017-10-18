//
//  MasterViewController.h
//  EveryDo
//
//  Created by Olga on 10/17/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"
#import "AddNewTodoViewController.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, AddItemViewControlleDelegate>

@property Todo *toDoToSave;

@end

