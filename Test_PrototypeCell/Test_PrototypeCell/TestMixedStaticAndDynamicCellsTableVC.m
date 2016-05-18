//
//  TestMixedStaticAndDynamicCellsTableVC.m
//  Test_PrototypeCell
//
//  Created by forp on 16/5/12.
//  Copyright © 2016年 forp. All rights reserved.
//

#import "TestMixedStaticAndDynamicCellsTableVC.h"

#import "CustomPrototypeCell1.h"
#import "CustomPrototypeCell2.h"
#import "CustomPrototypeCell3.h"
#import "CustomPrototypeCell4.h"

@interface TestMixedStaticAndDynamicCellsTableVC () {
    NSArray *dataSourceArray;
    NSMutableArray *mArrayRandom;
}

@end

@implementation TestMixedStaticAndDynamicCellsTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self loadDefaultData];
    [self loadDefaultSetting];
}

#pragma mark - Load default data
- (void)loadDefaultData {
    //
    NSMutableArray *mArr = [NSMutableArray array];
    for (NSUInteger index = 0; index < 13; index ++) {
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"Test %zd",index + 1],@"title", [NSString stringWithFormat:@"mutiple prototypeCell %zd",index + 1],@"location", [NSString stringWithFormat:@"type %zd",index + 1],@"type", [NSString stringWithFormat:@"0%zd",index + 1],@"image", nil];
        [mArr addObject:dict];
    }
    dataSourceArray = [mArr copy];
}

#pragma mark - Load default Settings
- (void)loadDefaultSetting {
    //
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomPrototypeCell1" bundle:nil] forCellReuseIdentifier:@"MutiplePrototypCell1"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomPrototypeCell1" bundle:nil] forCellReuseIdentifier:@"MutiplePrototypCell4"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomPrototypeCell2" bundle:nil] forCellReuseIdentifier:@"MutiplePrototypCell2"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomPrototypeCell3" bundle:nil] forCellReuseIdentifier:@"MutiplePrototypCell3"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomPrototypeCell4" bundle:nil] forCellReuseIdentifier:@"MutiplePrototypCell4"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        //
        if (!mArrayRandom) {
            mArrayRandom = [NSMutableArray arrayWithCapacity:dataSourceArray.count];
        } else {
            [mArrayRandom removeAllObjects];
        }
        
        for (NSUInteger index = 0; index < dataSourceArray.count; index ++) {
            [mArrayRandom addObject:[NSNumber numberWithInteger:arc4random()%4]];
        }
        
        return dataSourceArray.count;
    }
    else if (section > 1){
        section--;
    }
    
    return [super tableView:tableView numberOfRowsInSection:section];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (indexPath.section <= 0) { // section <= 0 indicates static cells
        cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
        
        // Configure the cell...
        
    } else { // section > 0 indicates dynamic cells
        //
        [mArrayRandom replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithInteger:arc4random()%4]];
        NSInteger randomIn4 = [mArrayRandom[indexPath.row] integerValue];
        NSLog(@"randomIn4:%zd--cellForRow:%zd",randomIn4,indexPath.row);
        switch (randomIn4) {
            case 0:
            {
                //
                CustomPrototypeCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"MutiplePrototypCell1" forIndexPath:indexPath];
                
                // Configure the cell...
                NSDictionary *dict = dataSourceArray[indexPath.row];
                cell.customLabelName.text = dict[@"title"];
                cell.customLabelLocation.text = dict[@"location"];
                cell.customLabelType.text = dict[@"type"];
                cell.customImageView.image = [UIImage imageNamed:dict[@"image"]];
                cell.customImageView.layer.cornerRadius = cell.customImageView.frame.size.width / 2;
                cell.customImageView.clipsToBounds = true;
                
                return cell;
            }
                break;
            case 1:
            {
                //
                CustomPrototypeCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"MutiplePrototypCell2" forIndexPath:indexPath];
                
                // Configure the cell...
                NSDictionary *dict = dataSourceArray[indexPath.row];
                cell.customLabelName.text = dict[@"title"];
                cell.customLabelLocation.text = dict[@"location"];
                cell.customLabelType.text = dict[@"type"];
                
                return cell;
            }
                break;
            case 2:
            {
                //
                CustomPrototypeCell3 *cell = [tableView dequeueReusableCellWithIdentifier:@"MutiplePrototypCell3" forIndexPath:indexPath];
                
                // Configure the cell...
                NSDictionary *dict = dataSourceArray[indexPath.row];
                cell.customLabelName.text = dict[@"title"];
                cell.customImageView.image = [UIImage imageNamed:dict[@"image"]];
                cell.customImageView.layer.cornerRadius = cell.customImageView.frame.size.width / 2;
                cell.customImageView.clipsToBounds = true;
                
                return cell;
            }
                break;
            case 3:
            {
                //
                CustomPrototypeCell4 *cell = [tableView dequeueReusableCellWithIdentifier:@"MutiplePrototypCell4" forIndexPath:indexPath];
                
                // Configure the cell...
                NSDictionary *dict = dataSourceArray[indexPath.row];
                cell.customLabelName.text = dict[@"title"];
                cell.customLabelLocation.text = dict[@"location"];
                cell.customLabelType.text = dict[@"type"];
                cell.customImageView.image = [UIImage imageNamed:dict[@"image"]];
                
                UIColor *randomColor = KColorRandom;
                cell.customLabelName.textColor = randomColor;
                cell.customLabelLocation.textColor = randomColor;
                cell.customLabelType.textColor = randomColor;
                
                return cell;
            }
                break;
                
            default:
                break;
        }
        
    }
    
    // Configure the cell...
    
    return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return nil;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

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

#pragma mark UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 44.0f;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 5;
}

//
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    else if (indexPath.section > 0){//
        NSInteger randomIn4 = [mArrayRandom[indexPath.row] integerValue];
        NSLog(@"randomIn4:%zd--heightForRow:%zd",randomIn4,indexPath.row);
        if (randomIn4 == 3) {
            return 200;
        }
        
        return 80;
    }
    
    return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    
    
}

//
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //
    switch (indexPath.row) {
        case 0:
        {
            //
            
        }
            break;
        case 1:
        {
            //
        }
            break;
            
        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
