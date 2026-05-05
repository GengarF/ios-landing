#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;
- (void)sayHello;
- (void)updateName:(NSString *)name;
- (NSString *)profileText;

@end

NS_ASSUME_NONNULL_END
