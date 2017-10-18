//
//  AddNewTodoViewController.h
//  EveryDo
//
//  Created by Olga on 10/17/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@protocol AddItemViewControlleDelegate <NSObject>

- (void)insertNewObject: (Todo *) todoObj;

@end

@interface AddNewTodoViewController : UIViewController

@property (nonatomic, weak) id <AddItemViewControlleDelegate> delegate;

@property (nonatomic, weak) IBOutlet UITextField *titleTextField;
@property (nonatomic, weak) IBOutlet UITextField *descriptionTextField;
@property (nonatomic, weak) IBOutlet UITextField *priorityTextField;

- (IBAction)cancelAddingTodo:(UIButton *)sender;
- (IBAction)saveTodo:(UIButton *)sender;

@end
