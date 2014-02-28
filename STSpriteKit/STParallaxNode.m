//
//  STParallaxNode.m
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

#import "STParallaxNode.h"

#import "STParallaxNodeLayer_private.h"

@interface STParallaxNode ()

@property (nonatomic, assign, getter = isHorizontal) BOOL horizontal;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, strong) NSMutableArray* layers;

@end

@implementation STParallaxNode

+ (STParallaxNode*)horizontalParallaxNodeWithSize:(CGSize)size
{
    STParallaxNode* node = [STParallaxNode node];
    node.size = size;
    node.horizontal = YES;
    return node;
}

+ (STParallaxNode*)verticalParallaxNodeWithSize:(CGSize)size
{
    STParallaxNode* node = [STParallaxNode node];
    node.size = size;
    node.horizontal = NO;
    return node;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.layers = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addLayerWithChild:(SKNode*)child parallaxFactor:(CGFloat)factor position:(STParallaxNodeChildPosition)position flip:(BOOL)flip
{
    STParallaxNodeLayer* layer = [[STParallaxNodeLayer alloc] init];
    layer.child = child;
    layer.factor = factor;
    layer.position = position;
    layer.flip = flip;
    [self addLayer:layer];
}

- (void)addLayerWithChilds:(NSArray*)childs parallaxFactor:(CGFloat)factor position:(STParallaxNodeChildPosition)position
{
    STParallaxNodeLayer* layer = [[STParallaxNodeLayer alloc] init];
    layer.childs = childs;
    layer.factor = factor;
    layer.position = position;
    [self addLayer:layer];
}

- (void)addLayer:(STParallaxNodeLayer*)layer
{
    layer.horizontal = self.horizontal;
    layer.zPosition = [self.layers count] + 1;
    [self.layers addObject:layer];
    
    SKNode* child = [layer createFirstChild];
    child.position = stp(0, 0);
    [self addChild:child];
}

- (void)updateWithIncrement:(CGFloat)increment
{
    for (STParallaxNodeLayer* layer in self.layers)
    {
        for (SKNode* child in layer.actualChilds)
        {
            CGPoint position = child.position;
            position.x -= increment * layer.factor;
            child.position = position;
        }
        
        SKNode* firstChild = [layer.actualChilds firstObject];
        SKNode* lastChild = [layer.actualChilds lastObject];
        
        if (increment > 0)
        {
            CGRect firstChildRect = [firstChild calculateAccumulatedFrame];
            CGRect lastChildRect = [lastChild calculateAccumulatedFrame];
            
            if (CGRectGetMaxX(firstChildRect) <= 0)
            {
                [layer removeChild:firstChild];
            }
            
            if (CGRectGetMaxX(lastChildRect) <= self.size.width)
            {
                SKNode* child = [layer createNeighbour:STParallaxNodeLayerNeighbourTrailing forChild:lastChild];
                child.position = stp(CGRectGetMaxX(lastChildRect), 0);
                [self addChild:child];
            }
        }
        else if (increment < 0)
        {
            CGRect firstChildRect = [firstChild calculateAccumulatedFrame];
            CGRect lastChildRect = [lastChild calculateAccumulatedFrame];
            
            if (CGRectGetMinX(lastChildRect) >= self.size.width)
            {
                [layer removeChild:lastChild];
            }
            
            if (CGRectGetMinX(firstChildRect) >= 0)
            {
                SKNode* child = [layer createNeighbour:STParallaxNodeLayerNeighbourLeading forChild:firstChild];
                child.position = stp(CGRectGetMinX(firstChildRect)-[child calculateAccumulatedFrame].size.width, 0);
                [self addChild:child];
            }
        }
    }
}

@end
