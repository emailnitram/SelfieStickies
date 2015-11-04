//
//  Stickers.m
//  SelfieStickies
//
//  Created by Martin Henry on 11/2/15.
//  Copyright © 2015 Martin Henry. All rights reserved.
//

#import "Stickers.h"
@interface Stickers()<UIGestureRecognizerDelegate>
@end

@implementation Stickers
- (instancetype)initWithImage:(UIImage *)image {
    self = [super initWithImage:image];
    if (self) {
        self.userInteractionEnabled = YES;
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
        UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
        self.gestureRecognizers = @[pan, pinch, rotation];
        for (UIGestureRecognizer *recognizer in self.gestureRecognizers) {
            recognizer.delegate = self;
        }
    }
    return self;
}

- (void)handlePinch:(UIPinchGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGFloat scale = gestureRecognizer.scale;
        
        [gestureRecognizer.view setTransform:CGAffineTransformScale(gestureRecognizer.view.transform, scale, scale)];
        [gestureRecognizer setScale:1.0];
    }
}


- (void)handleRotation:(UIRotationGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGFloat rotation = gestureRecognizer.rotation;
        [gestureRecognizer.view setTransform:CGAffineTransformRotate(gestureRecognizer.view.transform, rotation)];
        [gestureRecognizer setRotation:0];
    }
}

- (void)handlePan:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        
        [gestureRecognizer.view setTransform:CGAffineTransformTranslate(gestureRecognizer.view.transform, translation.x, translation.y)];
        [gestureRecognizer setTranslation:CGPointZero inView:gestureRecognizer.view];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
