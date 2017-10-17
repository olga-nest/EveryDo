//
//  AddNewTodoViewController.h
//  EveryDo
//
//  Created by Olga on 10/17/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewTodoViewController : UIViewController
@property (nonatomic, weak) IBOutlet UITextField *titleTextField;
@property (nonatomic, weak) IBOutlet UITextField *descriptionTextField;
@property (nonatomic, weak) IBOutlet UIPickerView *priorityPicker;

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property (weak, nonatomic) IBOutlet UIButton *SaveButton;

@end
