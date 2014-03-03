//
//  STParallaxNode.h
//  STSpriteKit
//
//  Created by Thomas Dupont on 27/02/2014.

/***********************************************************************************
 *
 * Copyright (c) 2014 Thomas Dupont
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 ***********************************************************************************/

#import <SpriteKit/SpriteKit.h>

#import "STParallaxNodeLayer.h"

@interface STParallaxNode : SKNode

/**
 *  Create an horizontal parallax node.
 *  @param size the size of the node
 *  @return the parallax node.
 */
+ (STParallaxNode*)horizontalParallaxNodeWithSize:(CGSize)size;

/**
 *  Create a vertical parallax node.
 *  @param size the size of the node
 *  @return the parallax node.
 */
+ (STParallaxNode*)verticalParallaxNodeWithSize:(CGSize)size;

/**
 *  Add a layer with a unique child.
 *
 *  @param child    the node to display. Its anchor point should be 0.5,0.5
 *  @param factor   the speed factor of the layer
 *  @param position the position of the child
 *  @param flip     YES if the child should be flipped one time in two, NO otherwise
 */
- (void)addLayerWithChild:(SKNode*)child parallaxFactor:(CGFloat)factor position:(STParallaxNodeChildPosition)position flip:(BOOL)flip;

/**
 *  Add a layer with an array of childs.
 *
 *  @param childs   an array containing the nodes to display. Their anchor points should be 0.5,0.5
 *  @param factor   the speed factor of the layer
 *  @param position the position of the childs
 *  @param policy   the policy to use to pick a child in the array of childs.
 */
- (void)addLayerWithChilds:(NSArray*)childs parallaxFactor:(CGFloat)factor position:(STParallaxNodeChildPosition)position policy:(STParallaxNodeLayerPickingPolicy)policy;

/**
 *  Add a custom layer.
 *
 *  @param layer the layer to add.
 */
- (void)addLayer:(STParallaxNodeLayer*)layer;

/**
 *  Update the parallax node with an increment value.
 *  A positive value will move the childs from right to left in horizontal mode and from bottom to top in vertical mode.
 *  A negative value will move the childs from left to right in horizontal mode and from top to bottom in vertical mode.
 *
 *  @param increment the increment value.
 */
- (void)updateWithIncrement:(CGFloat)increment;

@end
