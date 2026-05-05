#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    self = [super init];
    if (self) {
        _name = [name copy];
        _age = age;
    }
    return self;
}

- (void)sayHello {
    NSLog(@"Hello, my name is %@, age is %ld", self.name, (long)self.age);
}

- (void)updateName:(NSString *)name {
    self.name = name;
}

- (NSString *)profileText {
    return [NSString stringWithFormat:@"%@ - %ld", self.name, (long)self.age];
}

@end
