#import "TabNavController.h"

@interface TabNavController () {
    
    // Stack of view controllers
    NSMutableArray *tabBarVCs;
    
    // TabBar items
    UITabBar *myTabBar;
    NSMutableArray *tabBarItems;
    
}

@end

@implementation TabNavController

-(id) initWithRootViewController:(UIViewController *)rootViewController{
    
    self = [super initWithRootViewController:rootViewController];
    
    tabBarVCs = [[NSMutableArray alloc] init];
    
    [tabBarVCs addObject: rootViewController];
    
    [self setupTabBar];
    
    return self;
    
}

-(void) setupTabBar {
    
    myTabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50)];
    
    myTabBar.delegate = self;   //here you need import the protocol <UITabBarDelegate>
    
    tabBarItems = [[NSMutableArray alloc] init];
    
    UITabBarItem *tabBarItem1 = [self createTabBarItemWithTitle:@"Album" image:[UIImage imageNamed:@"albumB_album.png"] selectedImage:[UIImage imageNamed:@"albumB_albumP.png"] size:CGSizeMake(50, 50)];
    
    tabBarItem1.tag = 0;
    
    [tabBarItems addObject:tabBarItem1];
    
    myTabBar.items = tabBarItems;
    
    myTabBar.selectedItem = [tabBarItems objectAtIndex:0];
    
    UIViewController* vc = [tabBarVCs objectAtIndex:0];
    
    [vc.view addSubview:myTabBar];
    
}

-(void) addViewController:(UIViewController*) vc withTabBarTitle: (NSString*) title image:(UIImage*)image clickedImage:(UIImage*)clickedImage {
    
    [tabBarVCs addObject: vc];
    
    UITabBarItem *tabBarItem = [self createTabBarItemWithTitle:title image:image selectedImage:clickedImage size:CGSizeMake(50, 50)];
    
    tabBarItem.tag = tabBarItems.count;
    
    [tabBarItems addObject:tabBarItem];
    
    myTabBar.items = tabBarItems;
    
}

-(UITabBarItem*) createTabBarItemWithTitle:(NSString*)title image:(UIImage*)image selectedImage:(UIImage*) selectedImage size:(CGSize) size{
    
    image = [UIImage imageWithData:UIImagePNGRepresentation(image) scale:image.size.width/ size.width];
    
    selectedImage = [UIImage imageWithData:UIImagePNGRepresentation(selectedImage) scale:selectedImage.size.width/ size.width];
    
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectedImage];
    
    return tabBarItem;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    int selectedTag = tabBar.selectedItem.tag;
    
    if(![self.viewControllers containsObject: [tabBarVCs objectAtIndex:selectedTag]]) {
    
        NSLog(@"%d",(int)selectedTag);
        
        [self pushViewController:[tabBarVCs objectAtIndex:selectedTag] animated:NO];
        
        // Restore tabBar selected item
        myTabBar.selectedItem = [tabBarItems objectAtIndex:0];
        
    }
    
}

//-(void) setupTabBarItems {
//    
//    myTabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50)];
//    
//    myTabBar.delegate = self;   //here you need import the protocol <UITabBarDelegate>
//    
//    tabBarItems = [[NSMutableArray alloc] init];
//    
//    UITabBarItem *tabBarItem1 = [self createTabBarItemWithTitle:@"Album" image:[UIImage imageNamed:@"albumB_album.png"] selectedImage:[UIImage imageNamed:@"albumB_albumP.png"] size:CGSizeMake(50, 50)];
//    
//    tabBarItem1.tag = 0;
//    
//    UITabBarItem *tabBarItem2 = [self createTabBarItemWithTitle:@"Capture" image:[UIImage imageNamed:@"albumB_Capture.png"] selectedImage:[UIImage imageNamed:@"albumB_CaptureP.png"] size:CGSizeMake(50, 50)];
//    
//    tabBarItem2.tag = 1;
//    
//    UITabBarItem *tabBarItem3 = [self createTabBarItemWithTitle:@"Setting" image:[UIImage imageNamed:@"albumB_Setting.png"] selectedImage:[UIImage imageNamed:@"albumB_SettingP.png"] size:CGSizeMake(50, 50)];
//    
//    tabBarItem3.tag = 2;
//    
//    [tabBarItems addObject:tabBarItem1];
//    [tabBarItems addObject:tabBarItem2];
//    [tabBarItems addObject:tabBarItem3];
//    
//    myTabBar.items = tabBarItems;
//    myTabBar.selectedItem = [tabBarItems objectAtIndex:0];
//    
//}

@end
