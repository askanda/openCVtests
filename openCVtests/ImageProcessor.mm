//
//  ImageProcessor.m
//  EyeScope2
//
//  Created by Mike D'Ambrosio on 6/17/13.
//  Copyright (c) 2013 Mike D'Ambrosio. All rights reserved.
//

#import "ImageProcessor.h"
#import "UIImage+OpenCV.h"


@implementation ImageProcessor
@synthesize outUIImage;
@synthesize images;
@synthesize exposureMode;
cv::Mat myCvMat;
cv::Mat myGrayMat;

-(id)init
{
    self=[super init];
    if (self!=nil){
        images = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addImage: (UIImage *) image{
    [images addObject:image];
    NSUInteger numObjects = [images count];
    if (numObjects==1){
        [self processImage];
    }
    
    
}

- (void)processImage
{
    //image processing code
    NSLog(@"In the processImage method");
    NSUInteger numObjects = [images count];
    NSUInteger currentObjectIndex = numObjects - 1;
    myCvMat = [images[currentObjectIndex] CVMat];
    myGrayMat = [images[currentObjectIndex] CVGrayscaleMat];
    cv::Mat selRegion;
    selRegion = myGrayMat(cv::Range(100,200),cv::Range(100,200));
    
    cv::Scalar ROIavg = cv::mean(selRegion);
    NSLog(@"The image average is: %f",ROIavg.val[0] );
    cv::Mat singleChannelROI;
    double maxVal;
    int maxIdx;
    cv::minMaxIdx(myGrayMat, 0, &maxVal, 0, &maxIdx);
    NSLog(@"The max value in the ROI is: %f",maxVal);

}


- (void)thisImage:(UIImage *)image hasBeenSavedInPhotoAlbumWithError:(NSError *)error usingContextInfo:(void*)ctxInfo {
    if (error) {
        NSLog(@"error saving image");
        
        // Do anything needed to handle the error or display it to the user
    } else {
        NSLog(@"image saved in photo album");
        
        // .... do anything you want here to handle
        // .... when the image has been saved in the photo album
    }
}


@end
