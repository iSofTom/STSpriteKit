//
//  SKEmitterNode+STAdditions.h
//  STSpriteKit
//
//  Created by Thomas Dupont on 21/02/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKEmitterNode (STAdditions)

/**
 *  Create an emitter node
 *  @param resourceName The name of the sks resource in the main bundle
 *  @return an emitter node unarchived from the resource
 */
+ (SKEmitterNode*)emitterWithResourceNamed:(NSString*)resourceName;

/**
 *  Create an emitter node
 *  @param resourceName The name of the sks resource
 *  @param bundle       The bundle containing the resource
 *  @return an emitter node unarchived from the resource
 */
+ (SKEmitterNode*)emitterWithResourceNamed:(NSString*)resourceName inBundle:(NSBundle*)bundle;

@end
