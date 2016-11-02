//
//  MZInsetLabel.h
//
//  Created by mark.zhang on 7/26/16.
//  Copyright © 2016 veryitman. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^OnClickActionBlock)(id sender);

@interface MZInsetLabel : UILabel

@property (nonatomic, assign) UIEdgeInsets insets;

@property (nonatomic, assign) CGFloat leftInsets;
@property (nonatomic, assign) CGFloat rightInsets;
@property (nonatomic, assign) CGFloat topInsets;
@property (nonatomic, assign) CGFloat bottomInsets;

//Click the Label callback
@property (nonatomic, copy) OnClickActionBlock clickAction;

- (instancetype)initWithFrame:(CGRect)frame insets:(UIEdgeInsets)insets action:(OnClickActionBlock)actionBlock;

- (instancetype)initWithFrame:(CGRect)frame insets:(UIEdgeInsets)insets;

- (instancetype)initWithInsets:(UIEdgeInsets)insets;

@end
