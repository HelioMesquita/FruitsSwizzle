//
//  Fruit.h
//  Fruits
//
//  Created by Hélio Mesquita on 31/07/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Fruit : NSObject {
}

@property (nonatomic, strong, nonnull) NSString * fruitName;

- (id)initWithName:(NSString *)name;
- (NSString *) detail;


@end

NS_ASSUME_NONNULL_END
