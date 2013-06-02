//
//  TableViewCell.m
//  TestTableCell
//
//  Created by Gayle Dunham on 5/31/13.
//  Copyright (c) 2013 Gayle Dunham. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.LeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 0, 44, 44)];
        self.LeftImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight| UIViewAutoresizingFlexibleRightMargin;
        // Make the subviews of the cell opaque, for best performance
        self.LeftImageView.opaque = YES;

        self.centerTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 11, 200, 21)];
        self.centerTextLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.centerTextLabel.adjustsFontSizeToFitWidth = YES;
        self.centerTextLabel.minimumFontSize = 11;
        // Make the subviews of the cell opaque, for best performance
        self.centerTextLabel.opaque = YES;
        
        self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(268, 0, 44, 44)];
        self.rightImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight| UIViewAutoresizingFlexibleLeftMargin;
        // Make the subviews of the cell opaque, for best performance
        self.rightImageView.opaque = YES;
        
        [self.contentView addSubview:self.LeftImageView];
        [self.contentView addSubview:self.centerTextLabel];
        [self.contentView addSubview:self.rightImageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)willTransitionToState:(UITableViewCellStateMask)state
{
    UIView *imageView = self.rightImageView;
    UIView *labelView = self.centerTextLabel;
    
    CGRect labelFrame = labelView.frame;
    
    if (state & UITableViewCellStateShowingDeleteConfirmationMask) {

        labelFrame.size.width += 52;
        
        // Animating the fade while the image is sliding to the left is more jarring then just making it go away immediately
        imageView.alpha = 0.0;

        [UIView animateWithDuration:0.3 animations:^{
            labelView.frame = labelFrame;
        }];
        
    } else if (!self.rightImageView.alpha) {

        labelFrame.size.width -= 52;

        [UIView animateWithDuration:0.3 animations:^{
            imageView.alpha = 1.0;
            labelView.frame = labelFrame;
        }];
    }
    
    [super willTransitionToState:state];
}

@end
