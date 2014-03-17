//
//  STParallaxNodeLayer.h
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

/**
 *  The position of each child in the layer.
 *  STParallaxNodeChildPositionLeading is the bottom of the node in horizontal mode, and the left of the node in vertical mode.
 *  STParallaxNodeChildPositionTrailing is the top of the node in horizontal mode, and the right of the node in vertical mode.
 *  STParallaxNodeChildPositionCenter is the center of the node.
 *  STParallaxNodeChildPositionRandom is a random position between leading and trailing.
 */
typedef NS_ENUM(NSUInteger, STParallaxNodeChildPosition)
{
    STParallaxNodeChildPositionLeading,
    STParallaxNodeChildPositionTrailing,
    STParallaxNodeChildPositionCenter,
    STParallaxNodeChildPositionRandom
};

/**
 *  The policy to use to pick a child among the array of childs.
 *  STParallaxNodeLayerPickingPolicyCircular will pick from first to last and then the first again etc.
 *  STParallaxNodeLayerPickingPolicyRandom will randomly pick one from all the childs
 */
typedef NS_ENUM(NSInteger, STParallaxNodeLayerPickingPolicy)
{
    STParallaxNodeLayerPickingPolicyCircular,
    STParallaxNodeLayerPickingPolicyRandom
};

@interface STParallaxNodeLayer : NSObject

/**
 *  The child to display on the layer.
 *  If this property is set, the layer will only use it, and the childs array will be ignored.
 */
@property (nonatomic, strong) SKNode* child;

/**
 *  This childs to display on the layer.
 *  This property will be ignored if a child is set.
 */
@property (nonatomic, strong) NSArray* childs;

/**
 *  The speed factor of the layer.
 *  1.0 will move the child with the same speed as the parallax node.
 *  Default value is 1.0.
 */
@property (nonatomic, assign) CGFloat factor;

/**
 *  The position of each child.
 *  Default value is STParallaxNodeChildPositionLeading.
 */
@property (nonatomic, assign) STParallaxNodeChildPosition position;

/**
 *  The range used to get the position of each child.
 *  If the position is STParallaxNodeChildPositionLeading, positionRange.location is used.
 *  If the position is STParallaxNodeChildPositionTrailing, (positionRange.location + positionRange.length) is used.
 *  If the position is STParallaxNodeChildPositionCenter, (positionRange.location + positionRange.length / 2.0) is used.
 *  If the position is STParallaxNodeChildPositionRandom, a random value in the range is used.
 *  Default value is NSMakeRange(0,size.width) or NSMakeRange(0,size.height) based on the direction of the STParallaxNode.
 */
@property (nonatomic, assign) NSRange positionRange;

/**
 *  YES if the child should be flipped one time in two, NO otherwise.
 *  The property is used only if the child property is not nil.
 *  Default value is NO.
 */
@property (nonatomic, assign) BOOL flip;

/**
 *  The policy to use to pick a child among the array of childs.
 *  The property is used only if the child property is nil.
 *  Default value is STParallaxNodeLayerPickingPolicyCircular.
 */
@property (nonatomic, assign) STParallaxNodeLayerPickingPolicy pickingPolicy;

/**
 *  The range used to get the distance between the end of a child and the start of the next one.
 *  If marginRange.length is 0, marginRange.location is used.
 *  Otherwise a random value in the range is used.
 *  Default value is NSMakeRange(0,0).
 */
@property (nonatomic, assign) NSRange marginRange;

@end
