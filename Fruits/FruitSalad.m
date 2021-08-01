//
//  ObjcSalad.m
//  Fruits
//
//  Created by Hélio Mesquita on 31/07/21.
//

#import "FruitSalad.h"
#import "Banana.h"
#import <Fruits/Fruits-Swift.h>

@implementation FruitSalad

+ (NSArray<Fruit *> *)salad {
    return [NSArray arrayWithObjects: [[Banana alloc] init], [[Orange alloc] init], nil];
}

@end
