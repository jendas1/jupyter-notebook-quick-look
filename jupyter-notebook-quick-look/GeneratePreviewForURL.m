#import <Foundation/Foundation.h>
#import <QuickLook/QuickLook.h>
#import "GenerateHTMLForJupyter.h"
OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options);
void CancelPreviewGeneration(void *thisInterface, QLPreviewRequestRef preview);

/* -----------------------------------------------------------------------------
   Generate a preview for file

   This function's job is to create preview for designated file
   ----------------------------------------------------------------------------- */

OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options)
{
    NSURL * notebook_url = (__bridge NSURL *)url;
    NSString * out_path = GenerateHTMLForJupyter(notebook_url);
    CFDataRef data = (__bridge CFDataRef) [NSData dataWithContentsOfFile:out_path];
    QLPreviewRequestSetDataRepresentation(preview, data, kUTTypeHTML, NULL);
    return noErr;
}

void CancelPreviewGeneration(void *thisInterface, QLPreviewRequestRef preview)
{
    // Implement only if supported
}
