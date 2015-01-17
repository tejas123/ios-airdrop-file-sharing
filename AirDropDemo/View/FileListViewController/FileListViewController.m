//
//  FileListViewController.m
//  AirDropDemo
//
//  Created by Trupti on 03/01/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "FileListViewController.h"
#import "DocumentViewController.h"

@interface FileListViewController () {
    NSArray *files;
}

@end

@implementation FileListViewController

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    files = @[@"Taj Mahel.png", @"Squared EULA.pdf", @"Achievements.txt"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    DocumentViewController *destViewController = segue.destinationViewController;
    destViewController.documentName = [files objectAtIndex:indexPath.row];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [files count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [files objectAtIndex:indexPath.row];
    
    return cell;
}

@end