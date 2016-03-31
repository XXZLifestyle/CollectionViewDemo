//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by Jiayu_Zachary on 15/12/16.
//  Copyright © 2015年 Zachary. All rights reserved.
//

#import "ViewController.h"
#import "SystemViewController.h"
#import "CustomViewController.h"

@interface ViewController ()

- (IBAction)systemAction:(id)sender;
- (IBAction)customAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"首页";
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] init];
    back.title  =@"";
    self.navigationItem.backBarButtonItem = back;
}

#pragma mark - action
- (IBAction)systemAction:(id)sender {
    SystemViewController *system = [[SystemViewController alloc] init];
    system.navigationItem.title = @"System";
    [self.navigationController pushViewController:system animated:YES];
}

- (IBAction)customAction:(id)sender {
    CustomViewController *custom = [[CustomViewController alloc] init];
    custom.navigationItem.title = @"Custom";
    [self.navigationController pushViewController:custom animated:YES];
}

#pragma mark - build layout
- (void)buildLayout {
    
}

#pragma mark - getter


#pragma mark - dealloc
- (void)dealloc {
    
}

#pragma mark - other
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
