//
//  GameViewController.m
//  SpaceCatAdventure
//
//  Created by Aleksander Makedonski on 2/9/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

#import "GameViewController.h"
#import "THTitleScene.h"

@implementation GameViewController

- (void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // Load the SKScene from 'GameScene.sks'
    SKScene * scene = [TitleScene nodeWithFileNamed:@"THTitleScene.sks"];
    
    // Set the scale mode to scale to fit the window
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    SKView *skView = (SKView *)self.view;
    
    // Present the scene
    [skView presentScene:scene];
    
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];


}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}



@end
