//
//  TableViewCell.h
//  TestTableCell
//
//  Created by Gayle Dunham on 5/31/13.
//  Copyright (c) 2013 Gayle Dunham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *LeftImageView;
@property (strong, nonatomic) IBOutlet UILabel     *centerTextLabel;
@property (strong, nonatomic) IBOutlet UIImageView *rightImageView;

@end
