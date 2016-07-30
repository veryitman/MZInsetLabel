#import <UIKit/UIKit.h>

@interface MZInsetLabel : UILabel

@property (nonatomic, assign) UIEdgeInsets insets;

@property (nonatomic, assign) CGFloat leftInsets;
@property (nonatomic, assign) CGFloat rightInsets;
@property (nonatomic, assign) CGFloat topInsets;
@property (nonatomic, assign) CGFloat bottomInsets;

- (instancetype)initWithFrame:(CGRect)frame insets:(UIEdgeInsets)insets;

- (instancetype)initWithInsets:(UIEdgeInsets)insets;

- (void)setOnClickListener:(id)target selector:(SEL)callback;

@end
