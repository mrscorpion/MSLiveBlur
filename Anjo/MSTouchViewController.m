//
//  MSTouchViewController.m
//  Anjo
//
//  Created by mr.scorpion on 16/8/1.
//  Copyright © 2016年 Dmitry mr.scorpion. All rights reserved.
//

#import "MSTouchViewController.h"
#import "MSLiveBlurView.h"

#define kMSTableViewMainBackgroundImageFileName @"bg.jpg"

@interface MSTouchViewController ()
@property (nonatomic, strong) MSAnjoView *backgroundView;
@end

@implementation MSTouchViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Touch Blur", nil);
    self.navigationItem.title = self.title;
    self.navigationController.navigationBar.translucent = YES;
    
    MSAnjoView *backgroundView = [[MSAnjoView alloc] initWithFrame: self.view.bounds];
    backgroundView.originalImage = [UIImage imageNamed:@"tojane.jpg"];
    backgroundView.isGlassEffectOn = YES;
    self.backgroundView = backgroundView;
    [self.view addSubview:backgroundView];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 0.0 ~ 1.0
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self.view];
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat lever = fabs(point.y - (height / 2)) * 2 / height;
    lever = lever * 1.0;
//    NSLog(@"lever --> %f", lever);
    [self.backgroundView setBlurLevel:lever];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
