#import "MZInsetLabel.h"

@implementation MZInsetLabel

@synthesize insets = _insets;

- (instancetype)init
{
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    return [self initWithInsets:insets];
}

- (instancetype)initWithFrame:(CGRect)frame insets:(UIEdgeInsets)insets
{
    if (self = [super initWithFrame:frame]) {
        self.insets = insets;
    }
    
    return self;
}

- (instancetype)initWithInsets:(UIEdgeInsets)insets
{
    if (self = [super init]) {
        self.insets = insets;
    }
    
    return self;
}

- (void)drawTextInRect:(CGRect)rect
{
    CGRect curRect = UIEdgeInsetsInsetRect(rect, self.insets);
    [super drawTextInRect:curRect];
}

- (void)setOnClickListener:(id)target selector:(SEL)callback
{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:callback];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:gesture];
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
