//
//  JsonParsingTableViewController.m
//  Json Parsing
//
//  Created by Apple on 20/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "JsonParsingTableViewController.h"
#import "Model.h"
#import "JsonDataTableViewCell.h"

@interface JsonParsingTableViewController (){
    Model *model;
}

@end

@implementation JsonParsingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"JsonData" ofType:@"json"];
    //NSData *data = [NSData dataWithContentsOfFile:filePath];
    //NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        @try {
            NSData *data = [NSData dataWithContentsOfFile:filePath];
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSError *error;
            if (data!=nil) {
                id jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                model= [[Model alloc] initWithDict:jsonData];
                NSLog(@"evename: %@", model.evename);
                NSLog(@"eveid: %@", model.eveid);
                NSLog(@"evedesc: %@", model.evedesc);
                NSLog(@"evemaxteamsize: %@", model.evemaxteamsize);
                NSLog(@"cveid: %@", model.cveid);
                NSLog(@"cvename: %@", model.cvename);
                NSLog(@"cventcvetname: %@", model.cventcvetname);
                NSLog(@"cventcvetno: %@", model.cventcvetno);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
                
            }
        }
        @catch (NSException *exception) {
            
        }
        @finally {
            
        }
    });

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    static NSString *simpleTableIdentifier = @"JsonDataTableViewCell";
    
    JsonDataTableViewCell *cell = (JsonDataTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"JsonDataTableViewCell" owner:self options:nil];
    cell = [nib objectAtIndex:0];
    
    if (cell == nil)
    {
        cell = [[JsonDataTableViewCell alloc] init];
    }
    
    if(model!=nil)
    {
        cell.nameLabel.text = [NSString stringWithFormat:@"%@",model.evename];
        //cell.textArea.text = [NSString stringWithFormat:@"%@",model.plot];
        //cell.thumbnailImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%li",indexPath.row+1]];
    }
    else
    {
        cell.nameLabel.text = [NSString stringWithFormat:@"evename %li",indexPath.row+1];
        //cell.textArea.text = [NSString stringWithFormat:@"Plot %li",indexPath.row+1];
        //cell.thumbnailImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%li",indexPath.row+1]];
    }
    //cell.thumbnailImageView.image = [UIImage imageNamed:@"IMG_5327.JPG"];
    
    //[cell.button addTarget:self action:@selector(cellButtonWasTapped)
          //forControlEvents:UIControlEventTouchUpInside];;
    
    
    return cell;
}


-(int)heightForRowAtIndexPath:(JsonDataTableViewCell *)SimpleTableCell{
    return 260;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
