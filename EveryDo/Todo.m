#import "Todo.h"

@implementation Todo

- (instancetype)initWithTitle: (NSString *)title andDescription: (NSString *) description andPriority: (int) priority
{
    self = [super init];
    if (self) {
        _title = title;
        _todoDescription = description;
        _priorityNumber = priority;
        _isCompleted = NO;
    }
    return self;
}
@end
