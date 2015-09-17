//
//  NotesCell.m
//  Funny
//
//  Created by qianfeng on 15/9/17.
//  Copyright (c) 2015年 __None__. All rights reserved.
//

#import "NotesCell.h"
#import "FunnyHeader.h"
@implementation NotesCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)createCellUIWithModel:(NoteModel *)model{
    [_cellImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@/%@0.png",PIC_URL,model.Prefix,model.Prefix]]];
    _cellImg.contentMode = UIViewContentModeScaleAspectFit;
    _nameLabel.text = model.NameSC;
    if ([model.Local isEqualToString:@"1"]) {
        _statusLabel.text = @"已下载";
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
