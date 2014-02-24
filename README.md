STSpriteKit
===========

SpriteKit helpers and additions.


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

## Utils

Add some function to easyly manipulate CGPoint and CGSize.

