#import <UIKit/UIKit.h>
#import<AssetsLibrary/AssetsLibrary.h>

// We can't import the CustomCamera class because it would make a circular reference, so "fake" the existence of the class like this:
@class igencamera;

extern NSString * const pathstring;

@interface igencameraController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>



// Action method
-(IBAction) takePhotoButtonPressed:(id)sender forEvent:(UIEvent*)event;

// Declare some properties (to be explained soon)
@property (strong, nonatomic) igencamera* plugin;
@property (strong, nonatomic) UIImagePickerController* picker;
@property (strong, atomic) ALAssetsLibrary* library;

-(IBAction) close:(id)sender forEvent:(UIEvent*)event;


@end
