//
//  SKEmitterNode+STAdditions.h
//  STSpriteKit
//
//  Created by Thomas Dupont on 21/02/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKEmitterNode (STAdditions)

+ (SKEmitterNode*)emitterWithResourceNamed:(NSString*)resourceName;

+ (SKEmitterNode*)emitterWithResourceNamed:(NSString*)resourceName inBundle:(NSBundle*)bundle;

@end
