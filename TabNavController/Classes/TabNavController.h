
@interface TabNavController : UINavigationController <UITabBarDelegate>

-(void) addViewController:(UIViewController*) vc withTabBarTitle: (NSString*) title image:(UIImage*)image clickedImage:(UIImage*)clickedImage;

@end
