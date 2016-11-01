//
//  MZInsetLabel.m
//
//  Created by mark.zhang on 7/26/16.
//  Copyright © 2016 veryitman. All rights reserved.
//
#import "MZInsetLabel.h"
#import <objc/runtime.h>

static const char *sAssociatedKey;

@interface MZInsetLabel ()

- (void)configGestureAction;

@end

@implementation MZInsetLabel

@synthesize insets = _insets;

- (instancetype)init
{
    UIEdgeInsets insets = UIEdgeInsetsZero;
    
    return [self initWithInsets:insets];
}

- (instancetype)initWithFrame:(CGRect)frame insets:(UIEdgeInsets)insets
{
    if (self = [super initWithFrame:frame]) {
        self.insets = insets;
        
        [self configGestureAction];
    }
    
    return self;
}

- (instancetype)initWithInsets:(UIEdgeInsets)insets
{
    if (self = [super init]) {
        self.insets = insets;
        
        [self configGestureAction];
    }
    
    return self;
}

- (void)drawTextInRect:(CGRect)rect
{
    CGRect curRect = UIEdgeInsetsInsetRect(rect, self.insets);
    [super drawTextInRect:curRect];
}

- (void)configGestureAction
{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doClickInsetLabelAction:)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:gesture];
}

- (void)doClickInsetLabelAction:(id)sender
{
    self.onClickActionBlock(sender);
}

#pragma mark Setter & Getter.

- (void)setOnClickActionBlock:(OnClickActionBlock)onClickActionBlock
{
    objc_setAssociatedObject(self, sAssociatedKey, onClickActionBlock, OBJC_ASSOCIATION_COPY);
}

- (OnClickActionBlock)onClickActionBlock
{
    return objc_getAssociatedObject(self, sAssociatedKey);
}

- (UIEdgeInsets)insets
{
    return _insets;
}

- (void)setInsets:(UIEdgeInsets)insets
{
    _insets = insets;
    [self setNeedsDisplay];
}

- (CGFloat)leftInsets
{
    return _insets.left;
}

- (void)setLeftInsets:(CGFloat)leftInsets
{
    UIEdgeInsets insets = UIEdgeInsetsMake(_insets.top, leftInsets, _insets.bottom, _insets.right);
    self.insets = insets;
}

- (void)setRightInsets:(CGFloat)rightInsets
{
    UIEdgeInsets insets = UIEdgeInsetsMake(_insets.top, _insets.left, _insets.bottom, _insets.right);
    self.insets = insets;
}

- (void)setTopInsets:(CGFloat)topInsets
{
    UIEdgeInsets insets = UIEdgeInsetsMake(topInsets, _insets.left, _insets.bottom, _insets.right);
    self.insets = insets;
}

- (void)setBottomInsets:(CGFloat)bottomInsets
{
    UIEdgeInsets insets = UIEdgeInsetsMake(_insets.left, _insets.top, bottomInsets, _insets.right);
    self.insets = insets;
}

@end
