#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] initWithName:@"Jiale" age:18];

        [person sayHello];
        [person updateName:@"Codex"];
        [person sayHello];

        Person *emptyPerson = nil;
        [emptyPerson sayHello];

        NSString *profile = [person profileText];
        NSLog(@"Profile: %@", profile);

        NSLog(@"Program finished.");
    }

    return 0;
}
