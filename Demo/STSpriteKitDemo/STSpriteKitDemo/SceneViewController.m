//
//  SceneViewController.m
//  STSpriteKitDemo
//
//  Created by Thomas Dupont on 03/03/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#import "SceneViewController.h"

@interface SceneViewController ()

@property (nonatomic, assign) Class sceneClass;

@end

@implementation SceneViewController

- (id)initWithSceneClass:(Class)c
{
    self = [super init];
    if (self)
    {
        self.sceneClass = c;
    }
    return self;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    SKView * skView = (SKView *)self.view;
    
    if (!skView.scene)
    {
#ifdef DEBUG
        skView.showsFPS = YES;
        skView.showsNodeCount = YES;
#endif
        
        SKScene* scene = [self.sceneClass sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        [skView presentScene:scene];
    }
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
