//
//  AddNewTodoViewController.m
//  EveryDo
//
//  Created by Olga on 10/17/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import "AddNewTodoViewController.h"

@interface AddNewTodoViewController ()

@end

@implementation AddNewTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup `after loading the view.
}



- (IBAction)cancelAddingTodo:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)saveTodo:(UIButton *)sender {
  
    Todo *todoToSave = [Todo new];
    todoToSave.title = self.titleTextField.text;
    todoToSave.todoDescription = self.descriptionTextField.text;
    todoToSave.priorityNumber = self.priorityTextField.text;
    
    NSLog(@"Saving todo with title: %@, description: %@ and priority: %@", todoToSave.title, todoToSave.todoDescription, todoToSave.priorityNumber);
    
    [self.delegate insertNewObject:todoToSave];
    [self dismissViewControllerAnimated:true completion:nil];

    
}
@end
