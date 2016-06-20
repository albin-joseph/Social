//
//  ViewController.m
//  SampleCollectionView
//
//  Created by Albin Joseph on 06/04/16.
//  Copyright (c) 2016 RapidValue. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) UICollectionView *sampleCollectionView;

@end

@implementation ViewController

@synthesize sampleCollectionView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 1.0f;
    layout.minimumLineSpacing = 1.0f;
    sampleCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:layout];
        [sampleCollectionView setDataSource:self];
    [sampleCollectionView setDelegate:self];
    [sampleCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [sampleCollectionView setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:sampleCollectionView];
    

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    UIView *views=[[UIView alloc]initWithFrame:CGRectMake(0, 0, cell.bounds.size.width, cell.bounds.size.height/2.0)];
    [views setBackgroundColor:[UIColor greenColor]];
    [cell addSubview:views];
    [cell setClipsToBounds:YES];
    
    cell.backgroundColor=[UIColor whiteColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
         return CGSizeMake((self.view.bounds.size.width/2) - 10.0, 150);
    }
    else
    {
       return CGSizeMake((self.view.bounds.size.width) - 10.0, 70);
    }
   
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    CGSize headerSize = CGSizeMake(self.view.bounds.size.width, 45);
    return headerSize;
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    [cell.layer setCornerRadius:8.0f];
    
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 1.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 2.0;
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
   // UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
    return UIEdgeInsetsMake(0, 7, 0, 7);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    //https://iainhunter.wordpress.com/2012/11/08/howto-install-python3-pip3-tornado-on-mac/
    
    //http://www.tornadoweb.org/en/stable/
}


User Story: As a user I should able to get the Main Category of Application provided in the ICTIS.(It will shows as Main Menu)

-The relevant page, when it invoked it will present corresponding list of main menu  of ICTIS application. Each item will be a rectangle cell with icon and title.

-When the page lands, it would send userId and expect response , list of menu. The response contain the following informations
-When the I tap on the menu item, it will navigate to the corresponding  submenu page.


User Story: As a user I should able to get the sub menu names coming under main category in ICTIS.

-The relevant page, when it invoked it will present corresponding list of submenu items coming under main menu of ICTIS. Each item will be a rectangle cell with icon and title.

-When the page lands, it would send userId and main menu title and expect response , list of submenu coming under corresponding main menu. The response contain the following informations
-When the I tap on the submenu item, it will navigate to the corresponding application or application submenu page.



User Story: As a user I should able to reset my Unix account password through ICTIS.

-The relevant page, when invoked will present the user with two text boxes for  password entry and password verification along with a button to submit the request.

When the page lands, it would send the userid and expect a response based on whether the user has a UNIX account or not. Based on the response, appropriate message/control would be displayed to the user.
  -When the request is submitted, the iOS application would send following details and expect a response for successful job submission.
-User Id
-Password

-Once this response is received, iOS app will display a confirmation message to the user.


User Story: As a user I should able to see the on call person’s details through ICTIS

-The relevant page, when invoked it will present the list of team name , the I include. When each list associated with corresponding team’s on call person details as a dropdown list with three rows.

-When the page lands, it would send the user id and expect response, list of user including teams and corresponding team’s on call person details.

-When the I tap the team name, it will invoke a drop down list with three rows with the following information
-Primary
-Secondary
-Escalation

-Primary includes the detail of primary on call person Name, contact detail. Like Secondary and Escalation

-When the user tap on the dropdown row, it will invoke an alert message for the confirmation do you want to contact the corresponding on call person. If the user tap OK, it will invoke a phone call to corresponding contact.


User Story: As a user I should able to submit break glass request through ICTIS



User Story: As a user I should able to get the list of High Severity incidents

-The relevant page, when invoke it will shows list of high severity incidents coming under 1 and 2 with incidents number and short description.

When the page lands, populate the list of incidents coming under 1 and 2 related to the user, the details get from the previous view.
When the user tap one cell, it will navigate to the user to corresponding incident’s detail page.

User Story: As a user I should able to get the detail information of High Severity incident

-The relevant page, When invoked the page, it will shows the information corresponding to the incident as a list.

-When the page lands, populate the corresponding incidents detail information as list in tableview.


@end
