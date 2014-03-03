//
//  ViewController.m
//  STSpriteKitDemo
//
//  Created by Thomas Dupont on 20/02/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#import "ViewController.h"

#import "SceneViewController.h"
#import "ControlScene.h"
#import "HorizontalParallaxScene.h"
#import "VerticalParallaxScene.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView* tableView;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
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

#pragma mark -

- (void)presentSceneFromClass:(Class)c
{
    UIViewController* vc = [[SceneViewController alloc] initWithSceneClass:c];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableView DnD

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
    }
    
    if (indexPath.row == 0)
    {
        cell.textLabel.text = @"Control";
    }
    else if (indexPath.row == 1)
    {
        cell.textLabel.text = @"Horizontal Parallax";
    }
    else if (indexPath.row == 2)
    {
        cell.textLabel.text = @"Vertical Parallax";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        [self presentSceneFromClass:[ControlScene class]];
    }
    else if (indexPath.row == 1)
    {
        [self presentSceneFromClass:[HorizontalParallaxScene class]];
    }
    else if (indexPath.row == 2)
    {
        [self presentSceneFromClass:[VerticalParallaxScene class]];
    }
}

@end
