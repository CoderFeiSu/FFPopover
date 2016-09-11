//
//  FFPopoverCell.m
//  test
//
//  Created by 飞飞 on 16/9/10.
//  Copyright © 2016年 飞飞. All rights reserved.
//

#import "FFPopoverCell.h"

# define margin 5
@implementation FFPopoverCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"popoverCell";
    FFPopoverCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[FFPopoverCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}



- (void)layoutSubviews {
    [super layoutSubviews];
    // imageView尺寸
    CGRect imageViewFrame =  self.imageView.frame;
    imageViewFrame.origin.x = margin;
    imageViewFrame.origin.y = margin;
    imageViewFrame.size.height = self.bounds.size.height - 2 * margin;
    imageViewFrame.size.width = imageViewFrame.size.height;
    self.imageView.frame = imageViewFrame;
    
    // textLabel尺寸
    CGRect textLabelFrame = self.textLabel.frame;
    textLabelFrame.origin.x = CGRectGetMaxX(self.imageView.frame) + margin;
    textLabelFrame.size.width = (self.bounds.size.width - 3 * margin - imageViewFrame.size.width);
    self.textLabel.frame = textLabelFrame;
}


- (void)setFrame:(CGRect)frame {
    CGRect changeFrame = frame;
    changeFrame.size.height = frame.size.height - 1;
    frame = changeFrame;
    [super setFrame:frame];
}


@end
