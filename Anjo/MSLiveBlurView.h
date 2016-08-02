//
//  MSLiveBlurView.h
//  Anjo
//
//  Created by Dmitry mr.scorpion on 16/6/16.
//  Copyright (c) 2016 Dmitry mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kMSBlurredBackgroundDefaultLevel 0.9f
#define kMSBlurredBackgroundDefaultGlassLevel 0.2f
#define kMSBlurredBackgroundDefaultGlassColor [UIColor whiteColor]

@interface MSAnjoView : UIImageView

@property (nonatomic, strong) UIImage *originalImage;
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, assign) float initialBlurLevel;
@property (nonatomic, assign) float initialGlassLevel;
@property (nonatomic, assign) BOOL isGlassEffectOn;
@property (nonatomic, strong) UIColor *glassColor;

- (void)setBlurLevel:(float)blurLevel;

@end
