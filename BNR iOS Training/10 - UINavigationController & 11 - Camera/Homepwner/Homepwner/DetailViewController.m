//
//  DetailViewController.m
//  Homepwner
//
//  Created by Jeff Y Liu on 9/24/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "DetailViewController.h"
#import "BNRItem.h"

@interface DetailViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

@implementation DetailViewController

- (void)setItem:(BNRItem *)item {
    _item = item;
    self.navigationItem.title = item.itemName;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    BNRItem *item = self.item;
    self.nameField.text = item.itemName;
    self.serialNumberField.text = item.serialNumber;
    self.valueField.text = [NSString stringWithFormat:@"%d", item.valueInDollars];
    
    // Create a NSDateFormatter that will turn a date into a simple date string
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    
    // Use filtered NSDate object to set dateLabel contents
    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
    
    NSString *imageKey = self.item.imageKey;
    if (imageKey) {
        // Get image for image key from image store
        UIImage *imageToDisplay = [[BNRImageStore sharedStore] imageForKey:imageKey];
        self.imageView.image = imageToDisplay;
    } else {
        // Clear the imageView
        self.imageView.image = nil;
    }

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Clear first responder
    [self.view endEditing:YES];
    
    // "Save" changes to item
    BNRItem *item = self.item;
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialNumberField.text;
    item.valueInDollars = [self.valueField.text intValue];
}

- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    // If our device has a camera, we want to take a picture, otherwise, we just pick from photo library
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    // This line of code will generate a warning right now, ignore it.
    imagePicker.delegate = self;
    
    // Place image picker on the screen
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSString *oldKey = self.item.imageKey;
    
    // Did the item already have an image?
    if (oldKey) {
        // Delete the old image
        [[BNRImageStore sharedStore] deleteImageForKey:oldKey];
    }
    
    // Get picked image from info dictionary
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    // Create a NSUUID object - and get its string representation
    NSUUID *uuid = [[NSUUID alloc] init];
    NSString *key = [uuid UUIDString];
    
    self.item.imageKey = key;
    
    // Store the image in the BNRImageStore for this key
    [[BNRImageStore sharedStore] setImage:image forKey:self.item.imageKey];
    
    // Put that image onto the screen in our image view
    self.imageView.image = image;
    
    // Take image picker off the screen -
    // you must call this dismiss method
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
