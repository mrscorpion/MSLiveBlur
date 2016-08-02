//
//  MSMainViewController.m
//  Anjo
//
//  Created by Dmitry mr.scorpion on 16/6/16.
//  Copyright (c) 2016 Dmitry mr.scorpion. All rights reserved.
//

#import "MSMainViewController.h"
#import "MSLiveBlurView.h"
#import "MSTouchViewController.h"

#define kMSTableViewMainBackgroundImageFileName @"bg.jpg"
#define kMSTableViewDefaultCellHeight 50.0f
#define kMSTableViewDefaultContentInset 400.0f

@interface MSMainViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation MSMainViewController

@synthesize tableView = _tableView;
@synthesize items = _items;

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}
- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray new];
        NSArray *countryCodes = [NSLocale ISOCountryCodes];
        for (NSString *countryCode in countryCodes)
        {
            NSString *identifier = [NSLocale localeIdentifierFromComponents: [NSDictionary dictionaryWithObject: countryCode forKey: NSLocaleCountryCode]];
            NSString *country = [[NSLocale currentLocale] displayNameForKey: NSLocaleIdentifier value: identifier];
            [_items addObject: country];
        }
//        NSArray *arr = @[@"简书－－To Jane", @"", @"一行", @"写你的名字",@"", @"一行", @"诉说她们的故事", @"", @"还有一行", @"留给情书和诗",@"一封未加戳的信纸", @"",@"致给远方的大海", @"只言片语", @"",@"文／泊"];
//        _items = [arr mutableCopy];
    }
    return _items;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Anjo", nil);
    self.navigationItem.title = self.title;
    self.navigationController.navigationBar.translucent = YES;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.rowHeight = kMSTableViewDefaultCellHeight;
    
    // 添加实时模糊效果
    MSAnjoView *backgroundView = [[MSAnjoView alloc] initWithFrame: self.view.bounds];
    backgroundView.originalImage = [UIImage imageNamed:@"tojane.jpg"];
    backgroundView.scrollView = self.tableView;
    backgroundView.isGlassEffectOn = YES;
    
    self.tableView.backgroundView = backgroundView;
    self.tableView.contentInset = UIEdgeInsetsMake(kMSTableViewDefaultContentInset, 0, 0, 0);
    [self.view addSubview: self.tableView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toNext)];
    tap.numberOfTapsRequired = 2;
    [self.tableView addGestureRecognizer:tap];
}
- (void)toNext
{
    MSTouchViewController *touchVC = [[MSTouchViewController alloc] init];
    [self.navigationController pushViewController:touchVC animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}
@end
