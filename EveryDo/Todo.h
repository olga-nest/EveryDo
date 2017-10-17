#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *todoDescription;
@property (nonatomic) NSString *priorityNumber;
@property (nonatomic) BOOL isCompleted;

- (instancetype)initWithTitle: (NSString *)title andDescription: (NSString *) description andPriority: (NSString *) priority;

@end
