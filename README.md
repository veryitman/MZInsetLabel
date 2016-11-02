# MZInsetLabel
The subclass of UILabel who can be set insets.

It support ios7/ios7+.

## Install

Add it to your Podfile.

```
pod 'MZInsetLabel', '~> 0.3.0'
```

Or

```
pod 'MZInsetLabel'
```
If you can't search 'MZInsetLabel', you need run

```
pod repo update
```
to update your local repo.

## Usage


```
@interface ViewController ()

@property (nonatomic, strong) MZInsetLabel *insetLabel;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"MZInsetLabel Usage";
    
    // usage example: Avoid the retain cycle.
    {
        CGRect insetFrame = CGRectMake(50, 80, 170, 50);
        UIEdgeInsets insets = UIEdgeInsetsMake(30, 5, 10, 5);
        
        _insetLabel = [[MZInsetLabel alloc] initWithFrame:insetFrame insets:insets];
        
        self.insetLabel.backgroundColor = [UIColor lightGrayColor];
        self.insetLabel.text = @"www.veryitman.com";
        self.insetLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:self.insetLabel];
        
        // Avoid retain-cycle.
        typeof(&*self) __weak weakSelf = self;
        
        self.insetLabel.clickAction = ^(id sender) {
            MZInsetPage *page = [MZInsetPage new];
            [weakSelf.navigationController pushViewController:page animated:YES];
        };
    }
    
    // usage example: Generals.
    {
        CGRect insetFrame = CGRectMake(50, 200, 170, 50);
        UIEdgeInsets insets = UIEdgeInsetsMake(10, 5, 20, 5);
        
        MZInsetLabel *insetLabel = [[MZInsetLabel alloc] initWithFrame:insetFrame insets:insets action:^(id sender) {
            NSLog(@"sender: %@", sender);
        }];
        
        insetLabel.backgroundColor = [UIColor brownColor];
        insetLabel.text = @"www.veryitman.com";
        insetLabel.textAlignment = NSTextAlignmentLeft;
        insetLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:insetLabel];
    }
}

@end
```

Simple screenshot.

![0](http://odj6mf2ar.bkt.clouddn.com/MZInsetLabelUsage.png?attname=&e=1478059710&token=z2IU-kT8yrG5MTdRPoullKoxwVa7yxArGM91HAGZ:iMWCxXOeVNuDnAZCIRc8ejVTy_Y)


