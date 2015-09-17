//
//  NotesCell.h
//  Funny
//
//  Created by qianfeng on 15/9/17.
//  Copyright (c) 2015年 __None__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteModel.h"
@interface NotesCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *cellImg;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
- (void)createCellUIWithModel:(NoteModel *)model;
@end
