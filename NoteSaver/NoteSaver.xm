
// Logos by Dustin Howett
// See http://iphonedevwiki.net/index.php/Logos

/*
#error iOSOpenDev post-project creation from template requirements (remove these lines after completed) -- \
	Link to libsubstrate.dylib: \
	(1) go to TARGETS > Build Phases > Link Binary With Libraries and add /opt/iOSOpenDev/lib/libsubstrate.dylib \
	(2) remove these lines from *.xm files (not *.mm files as they're automatically generated from *.xm files)
*/

#import "CoreGraphics/CoreGraphics.h"
#import "UIKit/UIKit.h"



@interface NoteNavigationView <UIActionSheetDelegate>

@end

UITextView *itextView;

NSString *ititle;

%hook NoteNavigationView



- (void)shareButtonClicked:(UIButton *)_shareButton
{
    %log;
    UIActionSheet *popupQuery = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"E-Mail", @"Print", @"Save As Text", nil];
    popupQuery.actionSheetStyle = UIActionSheetStyleAutomatic;
    
    [popupQuery showInView:_shareButton];
    [popupQuery release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(int)buttonIndex
{
    %log;
    

    
    if (buttonIndex == 0) {
     
  
    } else if (buttonIndex == 1) {


    } else if (buttonIndex == 2) {
   
        system("mkdir /private/var/mobile/Documents/Notes");
        NSString *docDir =  [[NSString alloc]initWithFormat:@"/private/var/mobile/Documents/Notes/%@.txt",ititle];
        
        NSString *message =  [[NSString alloc]initWithFormat:@"File Saved To /private/var/mobile/Documents/Notes/%@.txt",ititle];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Done!" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        
        
        
        [itextView.text writeToFile:docDir atomically:YES encoding:NSUTF8StringEncoding error:nil];
        
        NSLog(@"%@",itextView.text);
     
    } 
    
}

%end


%hook NoteContentLayer

- (UITextView *)textView
{
    itextView = %orig;
    
    return %orig;
}

%end

%hook NotesDisplayController

- (void)setNote:(id)fp8
{
    %log;
    
    ititle = [fp8 title];
    
    %orig;  
}

%end
        
