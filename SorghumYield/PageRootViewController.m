//
//  PageRootViewController.m
//  SorghumYield
//
//  Created by cis on 26/11/2016.
//  Copyright © 2016 Robert Sebek. All rights reserved.
//

#import "PageRootViewController.h"
#import "PageContentViewController.h"
@interface PageRootViewController ()

@end

@implementation PageRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupView];
    
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    pageControl.backgroundColor = [UIColor whiteColor];
    
    UIImage *repeatingImage = [UIImage imageNamed:@"BackgroundPattern"];
    UIColor *repeatingBackground = [UIColor colorWithPatternImage:repeatingImage];
    [self.view setBackgroundColor:repeatingBackground];
    // TO:DO ++ Move this into viewcontroller to disable app wide
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    self.navigationItem.leftBarButtonItem=nil;
    self.navigationItem.hidesBackButton=YES;
    _pageTitles = @[@"Prepare a sheet of paper", @"Draw a solid square", @"Place the plant", @"Valid result", @"Common mistakes...", @"Plant off page", @"Plant touches square", @"Sharp angle", @"Sharp angle"];
    _pageImages = @[@"stepOnePage.pdf", @"stepTwoPage.pdf", @"stepThreePage.pdf", @"stepFourPage" ,@"",@"Mistake1",@"Mistake2",@"Mistake3",@"Mistake3"];

    // Adds skip button
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Skip"
         style:UIBarButtonItemStylePlain
         target:self
         action:@selector(pushPickerPage:)];
    [self.navigationItem setRightBarButtonItem:item animated:YES];

    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];

    [self disableBackButton];
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
}

- (void)viewWillAppear:(BOOL)animated{
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

- (void)setupView{
    [self setTitle:@"Photo Instructions"];
}

// Skips the instruction screens
-(void)pushPickerPage:(id)sender {
    // Creates picker view if needed - Strong reference to preserve data on text page
    if (_pickerPage == nil) {
        _pickerPage = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PhotoPickerScreenViewController"];
        [_pickerPage setValue:self.managedObject forKey:@"managedObject"];
    }
    [[self navigationController] pushViewController:_pickerPage animated:true];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers{
    
    if([pendingViewControllers[0] pageIndex]==_pageImages.count-1){
        [self pushPickerPage:nil];
    }
}


@end
