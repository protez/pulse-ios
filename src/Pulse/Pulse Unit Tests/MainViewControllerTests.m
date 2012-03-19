/*******************************************************************************
 *
 * MainViewControllerTests.m
 *
 * This file implements the MainViewControllerTests class that unit tests the
 * MainViewController class.
 *
 * Copyright 2012 Neudesic, LLC
 *
 *******************************************************************************/

#import "MainViewController.h"
#import "SignInViewController.h"

@interface MainViewControllerTests : GHTestCase
@end

@implementation MainViewControllerTests

- (void)testViewDidAppearPromptsUserToSignIn
{
    __block UINavigationController *navigationController;
    
    SignInViewController *signInViewController = [[SignInViewController alloc] init];
    
    MainViewController *mainViewController = [[MainViewController alloc] init];
    id mockMainViewController = [OCMockObject partialMockForObject:mainViewController];
    [[[mockMainViewController expect] andReturn:signInViewController] createSignInViewController];
    [[mockMainViewController expect] presentModalViewController:[OCMArg checkWithBlock:^BOOL(id value) {
        navigationController = (UINavigationController *)value;
        return [navigationController isKindOfClass:[UINavigationController class]];
    }] animated:YES];
    
    [mockMainViewController viewDidAppear:YES];
    
    [mockMainViewController verify];
    GHAssertEquals(UIModalPresentationFormSheet, navigationController.modalPresentationStyle, @"The modal presentation style should be UIModalPresentationFormSheet.");
    GHAssertEquals(UIModalTransitionStyleCoverVertical, navigationController.modalTransitionStyle, @"The modal transition style should be UIModalTransitionStyleCoverVertical.");
    GHAssertEqualObjects(signInViewController, navigationController.topViewController, @"The nagivation controller's top view controller should be the SignInViewController object.");
}

@end
