//
//  MZInsetLabel.m
//
//  Created by mark.zhang on 7/26/16.
//  Copyright © 2016 veryitman. All rights reserved.
//
#import "MZInsetLabel.h"
#import <objc/runtime.h>

static const char *sAssociatedKey = "MZ_InsetLabel_Key";

@interface MZInsetLabel ()

- (void)configGestureAction;

@end

@implementation MZInsetLabel

@synthesize insets = _insets;

- (instancetype)initWithFrame:(CGRect)frame insets:(UIEdgeInsets)insets action:(OnClickActionBlock)actionBlock
{
    if (self = [super initWithFrame:frame]) {
        _insets = insets;
        
        [self configGestureAction];
        
        self.clickAction = actionBlock;
    }
    
    return self;
}

- (instancetype)init
{
    UIEdgeInsets insets = UIEdgeInsetsZero;
    
    return [self initWithInsets:insets];
}

- (instancetype)initWithFrame:(CGRect)frame insets:(UIEdgeInsets)insets
{
    return [self initWithFrame:frame insets:insets action:nil];
}

- (instancetype)initWithInsets:(UIEdgeInsets)insets
{
    return [self initWithFrame:CGRectZero insets:insets action:nil];
}

/**
 *  Override drawTextInRect.
 */
- (void)drawTextInRect:(CGRect)rect
{
    CGRect curRect = UIEdgeInsetsInsetRect(rect, self.insets);
    [super drawTextInRect:curRect];
}

/**
 *  Add Gesture.
 */
- (void)configGestureAction
{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doClickInsetLabelAction:)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:gesture];
}

- (void)doClickInsetLabelAction:(id)sender
{
    self.clickAction(sender);
}

#pragma mark Setter & Getter.

- (void)setClickAction:(OnClickActionBlock)action
{
    objc_setAssociatedObject(self, sAssociatedKey, action, OBJC_ASSOCIATION_COPY);
}

- (OnClickActionBlock)clickAction
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
