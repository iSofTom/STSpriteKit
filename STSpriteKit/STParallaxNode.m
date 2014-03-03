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

#import "STSpriteKitUtils.h"
#import "STParallaxNodeLayer_private.h"

@interface STParallaxNode ()

@property (nonatomic, assign, getter = isHorizontal) BOOL horizontal;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, strong) NSMutableArray* layers;

@end

@implementation STParallaxNode

+ (STParallaxNode*)horizontalParallaxNodeWithSize:(CGSize)size
{
    STParallaxNode* node = [[STParallaxNode alloc] init];
    node.size = size;
    node.horizontal = YES;
    return node;
}

+ (STParallaxNode*)verticalParallaxNodeWithSize:(CGSize)size
{
    STParallaxNode* node = [[STParallaxNode alloc] init];
    node.size = size;
    node.horizontal = NO;
    return node;
}

+ (instancetype)node
{
    [NSException raise:@"STParallaxNodeException" format:@"The STParallaxNode should be created using one of the two constructors: horizontalParallaxNodeWithSize: and verticalParallaxNodeWithSize:"];
    return nil;
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

- (void)addLayerWithChilds:(NSArray*)childs parallaxFactor:(CGFloat)factor position:(STParallaxNodeChildPosition)position policy:(STParallaxNodeLayerPickingPolicy)policy
{
    STParallaxNodeLayer* layer = [[STParallaxNodeLayer alloc] init];
    layer.pickingPolicy = policy;
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
    
    SKNode* child = [self createNeighbour:STParallaxNodeLayerNeighbourTrailing onLayer:layer forChild:nil];
    [self addChild:child];
}

- (void)updateWithIncrement:(CGFloat)increment
{
    for (STParallaxNodeLayer* layer in self.layers)
    {
        for (SKNode* child in layer.actualChilds)
        {
            CGPoint position = child.position;
            if ([self isHorizontal])
            {
                position.x -= increment * layer.factor;
            }
            else
            {
                position.y += increment * layer.factor;
            }
            child.position = position;
        }
        
        SKNode* firstChild = [layer.actualChilds firstObject];
        SKNode* lastChild = [layer.actualChilds lastObject];
        
        CGRect firstChildRect = [firstChild calculateAccumulatedFrame];
        CGRect lastChildRect = [lastChild calculateAccumulatedFrame];
        
        if ([self isHorizontal])
        {
            if (increment > 0)
            {
                if (CGRectGetMaxX(firstChildRect) <= 0)
                {
                    [layer removeChild:firstChild];
                }
                
                if (CGRectGetMaxX(lastChildRect) <= self.size.width)
                {
                    SKNode* child = [self createNeighbour:STParallaxNodeLayerNeighbourTrailing onLayer:layer forChild:lastChild];
                    [self addChild:child];
                }
            }
            else if (increment < 0)
            {
                if (CGRectGetMinX(lastChildRect) >= self.size.width)
                {
                    [layer removeChild:lastChild];
                }
                
                if (CGRectGetMinX(firstChildRect) >= 0)
                {
                    SKNode* child = [self createNeighbour:STParallaxNodeLayerNeighbourLeading onLayer:layer forChild:firstChild];
                    [self addChild:child];
                }
            }
        }
        else
        {
            if (increment > 0)
            {
                if (CGRectGetMinY(lastChildRect) >= self.size.height)
                {
                    [layer removeChild:lastChild];
                }
                
                if (CGRectGetMinY(firstChildRect) >= 0)
                {
                    SKNode* child = [self createNeighbour:STParallaxNodeLayerNeighbourLeading onLayer:layer forChild:firstChild];
                    [self addChild:child];
                }
            }
            else if (increment < 0)
            {
                if (CGRectGetMaxY(firstChildRect) <= 0)
                {
                    [layer removeChild:firstChild];
                }
                
                if (CGRectGetMaxY(lastChildRect) <= self.size.height)
                {
                    SKNode* child = [self createNeighbour:STParallaxNodeLayerNeighbourTrailing onLayer:layer forChild:lastChild];
                    [self addChild:child];
                }
            }
        }
    }
}

- (SKNode*)createNeighbour:(STParallaxNodeLayerNeighbour)neighbour onLayer:(STParallaxNodeLayer*)layer forChild:(SKNode*)child
{
    SKNode* node = nil;
    CGRect childFrame;
    if (child)
    {
        node = [layer createNeighbour:neighbour forChild:child];
        childFrame = [child calculateAccumulatedFrame];
    }
    else
    {
        node = [layer createFirstChild];
        childFrame = str(0, 0, 0, 0);
    }
    
    CGRect nodeFrame = [node calculateAccumulatedFrame];
    
    CGFloat x = 0;
    CGFloat y = 0;
    
    if ([self isHorizontal])
    {
        if (neighbour == STParallaxNodeLayerNeighbourLeading)
        {
            x = CGRectGetMinX(childFrame) - nodeFrame.size.width/2.0;
        }
        else
        {
            x = CGRectGetMaxX(childFrame) + nodeFrame.size.width/2.0;
        }
        
        if (layer.position == STParallaxNodeChildPositionLeading)
        {
            y = nodeFrame.size.height/2.0;
        }
        else if (layer.position == STParallaxNodeChildPositionTrailing)
        {
            y = self.size.height - nodeFrame.size.height/2.0;
        }
        else if (layer.position == STParallaxNodeChildPositionCenter)
        {
            y = self.size.height/2.0;
        }
        if (layer.position == STParallaxNodeChildPositionRandom)
        {
            y = nodeFrame.size.height/2.0 + arc4random() % (int)(self.size.height - nodeFrame.size.height);
        }
    }
    else
    {
        if (neighbour == STParallaxNodeLayerNeighbourLeading)
        {
            y = CGRectGetMinY(childFrame) - nodeFrame.size.height/2.0;
        }
        else
        {
            y = CGRectGetMaxY(childFrame) + nodeFrame.size.height/2.0;
        }
        
        if (layer.position == STParallaxNodeChildPositionLeading)
        {
            x = nodeFrame.size.width/2.0;
        }
        else if (layer.position == STParallaxNodeChildPositionTrailing)
        {
            x = self.size.width - nodeFrame.size.width/2.0;
        }
        else if (layer.position == STParallaxNodeChildPositionCenter)
        {
            x = self.size.width/2.0;
        }
        if (layer.position == STParallaxNodeChildPositionRandom)
        {
            x = nodeFrame.size.width/2.0 + arc4random() % (int)(self.size.width - nodeFrame.size.width);
        }
    }
    
    node.position = stp(x,y);
    
    return node;
}

@end
