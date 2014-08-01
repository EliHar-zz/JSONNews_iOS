//
//  ViewController.m
//  JSONNews
//
//  Created by Elias Haroun on 2014-07-07.
//  Copyright (c) 2014 Elias Haroun. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()



@end

@implementation ViewController

NSDictionary *newsArticle;
int rowNumber;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"NEWS";
    
    NSURL *url = [NSURL URLWithString:@"API-site"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    _data = [NSMutableData new];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)newData {
    [_data appendData:newData];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    _jsonArray = [NSJSONSerialization JSONObjectWithData:_data options:nil error:nil];
    [_newsTable reloadData];
    
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No internet Connection" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alert show];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_jsonArray count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsTable"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newsTable"];
    }
    
    cell.textLabel.text = [[_jsonArray objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    newsArticle = [_jsonArray objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"go" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
