//
//  CustomPrototypeCell1.h
//  Test_PrototypeCell
//
//  Created by forp on 16/5/12.
//  Copyright © 2016年 forp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomPrototypeCell1 : UITableViewCell {
    
}

@property IBOutlet __weak UIImageView *customImageView;
@property __weak IBOutlet UILabel *customLabelName;
@property (weak, nonatomic) IBOutlet UILabel *customLabelLocation;
@property (weak, nonatomic) IBOutlet UILabel *customLabelType;

@end
