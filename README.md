STSpriteKit
===========

SpriteKit helpers and additions.

## Parallax

The STParallaxNode is a node that create parallax effect in a highly customizable way.

- It handle both horizontal and vertical directions (but only one at a time).
- You can add as many layers as you want on the parallax node.
- You can control the speed of the parallax node over time.
- Each layer has its own speed factor.
- A layer can display one child. That child will be copied as soon as necessary, and may even be flipped one time in two.
- A layer can display several childs. The pick up policy can be circular (in the array order) or random.
- A layer can position its child with different values, including random one from a range.
- The distance between each child of a layer is configurable with a random value from a range.

## Controls

The two subclasses: STControlNode and STControlSprite allow to add some control methods on your nodes.

### STControlNode

Those methods allow to be warn when a touchUp event is recognised:

```
- (void)setTouchUpTarget:(id)target action:(SEL)action;
- (void)setTouchUpBlock:(dispatch_block_t)touchUpBlock;
```

Those methods allow to be warn when a touchDown event is recognised:

```
- (void)setTouchDownTarget:(id)target action:(SEL)action;
- (void)setTouchDownBlock:(dispatch_block_t)touchDownBlock;
```

### STControlSprite

Those methods allow to be warn when a touchUpInside event is recognised:

```
- (void)setTouchUpInsideTarget:(id)target action:(SEL)action;
- (void)setTouchUpInsideBlock:(dispatch_block_t)touchUpInsideBlock;
```

Those methods allow to be warn when a touchUpOutside event is recognised:

```
- (void)setTouchUpOutsideTarget:(id)target action:(SEL)action;
- (void)setTouchUpOutsideBlock:(dispatch_block_t)touchUpOutsideBlock;
```

Those methods allow to be warn when a touchDown event is recognised:

```
- (void)setTouchDownTarget:(id)target action:(SEL)action;
- (void)setTouchDownBlock:(dispatch_block_t)touchDownBlock;
```

## Emitter

Those methods allow to easyly unarchive emitter resources:

```
+ (SKEmitterNode*)emitterWithResourceNamed:(NSString*)resourceName;
+ (SKEmitterNode*)emitterWithResourceNamed:(NSString*)resourceName inBundle:(NSBundle*)bundle;
```

## Actions

This category add some convenient methods to run actions:

```
- (void)runActionsSequence:(NSArray*)actions;
- (void)runActionsSequenceForever:(NSArray*)actions;
- (void)runActionsGroup:(NSArray*)actions;
- (void)runActionsGroupForever:(NSArray*)actions;
- (void)runAction:(SKAction*)action afterDelay:(NSTimeInterval)delay;
```

## SKScene

Propose an alternative algorithm for the SKScene's `nodeAtPoint:` method in order to deliver the touch to the pointed node considering its userInteractionEnabled value. In other words: if a node's userInteractionEnabled value is NO, the touch will be forwarded to the node below.

## Utils

Add some function to easyly manipulate CGPoint and CGSize.



# Usage

To include this component in your project, I recommend you to use [Cocoapods](http://cocoapods.org):

* Add `pod "STSpriteKit"` to your Podfile.



