#import "igencamera.h"
#import "igencameraController.h"
#import<AssetsLibrary/AssetsLibrary.h>


  // NSMutableArray * imageArray ;
NSString* const pathstring ;

@implementation igencameraController

//imageArray = [[NSMutableArray alloc] init];
//NSMutableArray *  im= [];


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

// Entry point method
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Instantiate the UIImagePickerController instance
        self.picker = [[UIImagePickerController alloc] init];
        
        // Configure the UIImagePickerController instance
        self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        self.picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
       self.picker.showsCameraControls = NO;
        
        // Make us the delegate for the UIImagePickerController
        self.picker.delegate = self;
        
        // Set the frames to be full screen
        CGRect screenFrame = [[UIScreen mainScreen] bounds];
      
        self.picker.view.frame = screenFrame;
        
   
        self.picker.cameraOverlayView = self.view;
     ;
    }
    return self;
}


// Action method.  This is like an event callback in JavaScript.
-(IBAction) takePhotoButtonPressed:(id)sender forEvent:(UIEvent*)event {
    // Call the takePicture method on the UIImagePickerController to capture the image.
    [self.picker takePicture];
}

-(IBAction) close:(id)sender forEvent:(UIEvent*)event {
    NSString* close = @"close";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    
    NSString * imgarray = [defaults objectForKey:@"k1"];
    
    [self.plugin capturedImageWithPath:imgarray];
    [defaults removeObjectForKey:@"k1"];
    
   // [self.plugin closecamera:close];
    // Call the takePicture method on the UIImagePickerController to capture the image.
   // [self.picker takePicture];
}
// Delegate method.  UIImagePickerController will call this method as soon as the image captured above is ready to be processed.  This is also like an event callback in JavaScript.


-(NSString*)generateRandomString:(int)num {
    NSMutableString* string = [NSMutableString stringWithCapacity:num];
    for (int i = 0; i < num; i++) {
        [string appendFormat:@"%C", (unichar)('a' + arc4random_uniform(25))];
    }
    return string;
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    
    // Get a reference to the captured image
   // UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
  // NSMutableArray * imageArray  = [[NSMutableArray alloc] init];
     UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
 //  NSString * obj = @"fjhdfgfh";
// [imageArray addObject:obj];
  //  NSString * test = [imageArray objectAtIndex:0];
     NSString* string = [self generateRandomString:5];
 //   NSString* string12 = [self generateRandomString:5];
  //  string12 = @"fjhdfgfh";

    
    //NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:obj,string, nil];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
   //
    
   // [defaults setObject:string12 forKey:@"key2"];

   // [defaults synchronize];
    
   // NSArray  * _nsarray = @[@"key1",@"key2",@"key3",@"key4",@"key5",@"key6"];
   
   //
  //  //NSString * stringsArray = [defaults objectForKey:@"key1"];
  //  NSString * stringsArray1 = [defaults objectForKey:@"key2"];
  //  NSString * stringsArray2 = [defaults objectForKey:@"key3"];
  //  NSString * stringsArray3 = [defaults objectForKey:@"key4"];
  //  NSString * stringsArra4 = [defaults objectForKey:@"key5"];
  //  NSString * stringsArray5 = [defaults objectForKey:@"key6"];
    
    
    
// NSArray *arr =   NSUserDefaults.standardUserDefaults().dictionaryRepresentation().values;
 // NSArray *arr = [[[NSUserDefaults standardUserDefaults] dictionaryRepresentation] allKeys];
    
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);

    
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [paths objectAtIndex:0];
   // NSURL *imgpath = [info objectForKey:UIImagePickerControllerMediaURL];
  //  NSString *str = [imgpath lastPathComponent];
   // NSString* string = [self generateRandomString:5];
    
    NSString * s1 = @".jpg";
    
    string = [string stringByAppendingString:s1 ];
   NSString* filename = string;
    NSString* imagePath = [documentsDirectory stringByAppendingPathComponent:filename];
    
    // Get the image data (blocking; around 1 second)
    NSData* imageData = UIImageJPEGRepresentation(image, 0.5);
    
    // Write the data to the file
   [imageData writeToFile:imagePath atomically:YES];
   
    NSString * str5 = [defaults objectForKey:@"k1"];
    
    if([str5 length] == 0)
    {
    [defaults setObject:imagePath forKey:@"k1"];
    }
    if([str5 length] != 0)
    {
      NSString * _sbuffer =   [defaults objectForKey:@"k1"];
        _sbuffer = [_sbuffer stringByAppendingString:@","];
        _sbuffer = [_sbuffer stringByAppendingString:imagePath];
         [defaults setObject:_sbuffer forKey:@"k1"];
        
        NSString *ck1 = [defaults objectForKey:@"k1"];
        
    }

    
   // [defaults setObject:@"" forKey:@"key1"];
   
    
   //   NSString* const pathstring = string;
   
    
    
    
    
    
    // Tell the plugin class that we're finished processing the image
   // [self.plugin capturedImageWithPath:imagePath];
}

- (IBAction)close:(id)sender {
}
@end