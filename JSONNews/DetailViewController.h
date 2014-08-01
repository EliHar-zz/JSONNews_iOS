//
//  DetailViewController.h
//  JSONNews
//
//  Created by Elias Haroun on 2014-07-07.
//  Copyright (c) 2014 Elias Haroun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITextView *article;

@end


extern int rowNumber;
extern NSDictionary *newsArticle;