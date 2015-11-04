//
//  ViewController.m
//  SelfieStickies
//
//  Created by Martin Henry on 11/2/15.
//  Copyright © 2015 Martin Henry. All rights reserved.
//

#import "ViewController.h"
#import "Stickers.h"

@interface ViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property Stickers *glasses;
@property Stickers *whiskers;
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.glasses = [[Stickers alloc] initWithImage:[UIImage imageNamed:@"glasses"]];
    [self.view addSubview:self.glasses];
    self.glasses.center = self.view.center;
    self.whiskers = [[Stickers alloc] initWithImage:[UIImage imageNamed:@"whiskers"]];
    [self.view addSubview:self.whiskers];
    self.whiskers.center = self.view.center;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)takePhotoButtonPressed:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)selectPhotoButtonPressed:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.mainImage.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
