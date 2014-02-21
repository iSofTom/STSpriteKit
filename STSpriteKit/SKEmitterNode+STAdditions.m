//
//  SKEmitterNode+STAdditions.m
//  STSpriteKit
//
//  Created by Thomas Dupont on 21/02/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#import "SKEmitterNode+STAdditions.h"

@implementation SKEmitterNode (STAdditions)

+ (SKEmitterNode*)emitterWithResourceNamed:(NSString*)resourceName
{
    return [self emitterWithResourceNamed:resourceName inBundle:[NSBundle mainBundle]];
}

+ (SKEmitterNode*)emitterWithResourceNamed:(NSString*)resourceName inBundle:(NSBundle*)bundle
{
    NSString* path = [bundle pathForResource:resourceName ofType:@"sks"];
    SKEmitterNode* node = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return node;
}

@end
