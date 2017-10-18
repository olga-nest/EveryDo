//
//  MasterViewController.m
//  EveryDo
//
//  Created by Olga on 10/17/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "CustomTableViewCell.h"


@interface MasterViewController ()

@property NSMutableArray *allTodos;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self createTodos];

    self.navigationItem.leftBarButtonItem = self.editButtonItem; 
    
}


- (void)viewWillAppear:(BOOL)animated {
}

-(void)createTodos {
    Todo *todo1 = [[Todo alloc]initWithTitle:@"Buy cat food" andDescription:@"Four bags" andPriority:@"High"];
    Todo *todo2 = [[Todo alloc]initWithTitle:@"Buy dog food" andDescription:@"Five bags" andPriority:@"High"];
    Todo *todo3 = [[Todo alloc]initWithTitle:@"This is a long long long long long title" andDescription:@"Four bags" andPriority:@"Low"];
    Todo *todo4 = [[Todo alloc]initWithTitle:@"Buy rat food" andDescription:@"This is a long long long long long long long long long description. Realy long long long long long long long long long long long long long long long long long long long long long long long long long long long description" andPriority:@"Low"];
    self.allTodos = [NSMutableArray arrayWithObjects:todo1, todo2, todo3, todo4, nil];
}


- (void)insertNewObject: (Todo *) todoObj {
    if (!self.allTodos) {
        self.allTodos = [[NSMutableArray alloc] init];
    }
    
    NSLog(@"Object recieved: with title: %@, description: %@ and priority: %@", todoObj.title, todoObj.todoDescription, todoObj.priorityNumber);
    
    [self.allTodos insertObject:todoObj atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView reloadData]; 
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *todo = self.allTodos[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:todo];
    } if ([[segue identifier] isEqualToString:@"toAddNewTodo"]) {
        
        AddNewTodoViewController *addNewTodoController = (AddNewTodoViewController *) [segue destinationViewController];
        addNewTodoController.delegate = self;
    }
}



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allTodos.count;
}


- (CustomTableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Todo *todo = self.allTodos[indexPath.row];
    cell.cellTitle.text = todo.title;
    cell.cellSubtitle.text = todo.todoDescription;
    cell.cellPriority.text = todo.priorityNumber;
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.allTodos removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}



@end
