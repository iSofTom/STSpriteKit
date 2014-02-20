//
//  ViewController.m
//  STSpriteKitDemo
//
//  Created by Thomas Dupont on 20/02/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"

@implementation ViewController

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    SKView * skView = (SKView *)self.view;
    
    if (!skView.scene)
    {
#ifdef DEBUG
        skView.showsFPS = YES;
        skView.showsNodeCount = YES;
#endif
        
        SKScene* scene = [MyScene sceneWithSize:skView.bounds.size];
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
