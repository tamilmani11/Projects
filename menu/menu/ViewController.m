 //
//  ViewController.m
//  menu
//
//  Created by BSA univ 13 on 29/01/14.
//  Copyright (c) 2014 BSA univ 13. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)penlayer:(UIPanGestureRecognizer *)sender;

@end

@implementation ViewController
@synthesize toplayer = _toplayer ;
@synthesize layerposition = _layerposition;
@synthesize tableview = _tableview  ;
@synthesize dataarray = _dataarray;
- (IBAction)back:(id)sender
{
    [self.view addSubview:self.toplayer];
    //[self.toplayer removeFromSuperview];
}

- (void)viewDidLoad
{
  
	// Do any additional setup after loading the view, typically from a nib.
    self.layerposition=self.toplayer.frame.origin.x;
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.dataarray=[NSMutableArray arrayWithObjects:@"FaceBookLogIn",@"HomeScreen",@"AddBook",@"Update",@"AddExcerpt",@"LogOut", nil];  [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#define VIEW_HIDDEN 260

-(void) animateLayerToPoint:(CGFloat)x
{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{CGRect frame=self.toplayer.frame;
                         frame.origin.x = x;
                         self.toplayer.frame=frame;
                     }
     
                     completion:^(BOOL finished){self.layerposition=self.toplayer.frame.origin.x;
                     }];
}
- (IBAction)slidelayer:(id)sender
{
    if(self.layerposition==VIEW_HIDDEN)
    {
        [self animateLayerToPoint:0];
    }
    else
    {
        [self animateLayerToPoint:VIEW_HIDDEN];
    }
}

- (IBAction)penlayer:(UIPanGestureRecognizer *)sender
{
   
    if(sender.state == UIGestureRecognizerStateChanged)
    {
        CGPoint point=[sender translationInView:self.toplayer];
        CGRect frame=self.toplayer.frame;
        frame.origin.x=point.x+self.layerposition;
        
        if(frame.origin.x<0)
            frame.origin.x=0;

        self.toplayer.frame=frame;
        }
    
    if(sender.state == UIGestureRecognizerStateEnded)
    {
        if(self.toplayer.frame.origin.x<=160)
        {
            [self animateLayerToPoint:0];
        }
        else
        {
            [self animateLayerToPoint:VIEW_HIDDEN];
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

   
    return self.dataarray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = nil;
    cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil)
    {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text=[self.dataarray objectAtIndex:indexPath.row];
    

    return cell;
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation!=UIInterfaceOrientationPortraitUpsideDown);
}
-(void) viewDidUnload
{
    [self setToplayer:nil];
    [self setTableview:nil];
    [super viewDidUnload];
}
@end
