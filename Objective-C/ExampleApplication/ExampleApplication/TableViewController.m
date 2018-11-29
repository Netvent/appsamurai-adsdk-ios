//
//  ViewController.m
//  ExampleApplication
//
//  Created by Levent ORAL on 22.11.2018.
//  Copyright © 2018 App Samurai Inc. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
    @property(nonatomic, copy) NSArray *AdFormatList;
    
    @property(nonatomic, copy) NSArray *SegueList;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.AdFormatList = @[@"Banner 320x50 from Storyboard",
                          @"Banner 320x50 Programatically",
                          @"Interstitial",
                          @"Rewarded Video"];
    self.SegueList = @[@"banner350x50FromStoryboardSegue",
                      @"banner320x50ProgramaticallySegue",
                      @"interstitialSegue",
                      @"rewardBasedVideoAdSegue"];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.AdFormatList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *basicCell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell"];
    basicCell.textLabel.text = self.AdFormatList[indexPath.row];
    return basicCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:self.SegueList[indexPath.row] sender:self];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}
@end
