#import <Foundation/Foundation.h>
#import <QuickLook/QuickLook.h>
#import "GenerateHTMLForJupyter.h"
OSStatus GenerateThumbnailForURL(void *thisInterface, QLThumbnailRequestRef thumbnail, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options, CGSize maxSize);
void CancelThumbnailGeneration(void *thisInterface, QLThumbnailRequestRef thumbnail);

/* -----------------------------------------------------------------------------
    Generate a thumbnail for file

   This function's job is to create thumbnail for designated file as fast as possible
   ----------------------------------------------------------------------------- */

OSStatus GenerateThumbnailForURL(void *thisInterface, QLThumbnailRequestRef thumbnail, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options, CGSize maxSize)
{
    NSURL * notebook_url = (__bridge NSURL *)url;
    NSString * out_path = GenerateHTMLForJupyter(notebook_url);
    CFDataRef data = (__bridge CFDataRef) [NSData dataWithContentsOfFile:out_path];
    QLThumbnailRequestSetThumbnailWithDataRepresentation(thumbnail, data, kUTTypeHTML, NULL, NULL);
    return noErr;
}

void CancelThumbnailGeneration(void *thisInterface, QLThumbnailRequestRef thumbnail)
{
    // Implement only if supported
}
