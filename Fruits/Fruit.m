//
//  Fruit.m
//  Fruits
//
//  Created by Hélio Mesquita on 31/07/21.
//

#import "Fruit.h"

@implementation Fruit

- (id)initWithName:(NSString *)name {
    _fruitName = name;
    return self;
}

- (NSString *)detail {
    return [NSString stringWithFormat:@"%@ was not swizzled", _fruitName];
}

@end
