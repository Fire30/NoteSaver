#line 1 "/Users/tj/Documents/iOSDevelopment/NoteSaver/NoteSaver/NoteSaver.xm"











#import "CoreGraphics/CoreGraphics.h"
#import "UIKit/UIKit.h"



@interface NoteNavigationView <UIActionSheetDelegate>

@end

UITextView *itextView;

NSString *ititle;

#include <substrate.h>
@class NoteContentLayer; @class NotesDisplayController; @class NoteNavigationView; 
static void (*_logos_orig$_ungrouped$NoteNavigationView$shareButtonClicked$)(NoteNavigationView*, SEL, UIButton *); static void _logos_method$_ungrouped$NoteNavigationView$shareButtonClicked$(NoteNavigationView*, SEL, UIButton *); static void (*_logos_orig$_ungrouped$NoteNavigationView$actionSheet$didDismissWithButtonIndex$)(NoteNavigationView*, SEL, UIActionSheet *, int); static void _logos_method$_ungrouped$NoteNavigationView$actionSheet$didDismissWithButtonIndex$(NoteNavigationView*, SEL, UIActionSheet *, int); static UITextView * (*_logos_orig$_ungrouped$NoteContentLayer$textView)(NoteContentLayer*, SEL); static UITextView * _logos_method$_ungrouped$NoteContentLayer$textView(NoteContentLayer*, SEL); static void (*_logos_orig$_ungrouped$NotesDisplayController$setNote$)(NotesDisplayController*, SEL, id); static void _logos_method$_ungrouped$NotesDisplayController$setNote$(NotesDisplayController*, SEL, id); 

#line 25 "/Users/tj/Documents/iOSDevelopment/NoteSaver/NoteSaver/NoteSaver.xm"





static void _logos_method$_ungrouped$NoteNavigationView$shareButtonClicked$(NoteNavigationView* self, SEL _cmd, UIButton * _shareButton) {
    NSLog(@"-[<NoteNavigationView: %p> shareButtonClicked:%@]", self, _shareButton);
    UIActionSheet *popupQuery = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"E-Mail", @"Print", @"Save As Text", nil];
    popupQuery.actionSheetStyle = UIActionSheetStyleAutomatic;
    
    [popupQuery showInView:_shareButton];
    [popupQuery release];
}


static void _logos_method$_ungrouped$NoteNavigationView$actionSheet$didDismissWithButtonIndex$(NoteNavigationView* self, SEL _cmd, UIActionSheet * actionSheet, int buttonIndex) {
    NSLog(@"-[<NoteNavigationView: %p> actionSheet:%@ didDismissWithButtonIndex:%d]", self, actionSheet, buttonIndex);
    

    
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







static UITextView * _logos_method$_ungrouped$NoteContentLayer$textView(NoteContentLayer* self, SEL _cmd) {
    itextView = _logos_orig$_ungrouped$NoteContentLayer$textView(self, _cmd);
    
    return _logos_orig$_ungrouped$NoteContentLayer$textView(self, _cmd);
}






static void _logos_method$_ungrouped$NotesDisplayController$setNote$(NotesDisplayController* self, SEL _cmd, id fp8) {
    NSLog(@"-[<NotesDisplayController: %p> setNote:%@]", self, fp8);
    
    ititle = [fp8 title];
    
    _logos_orig$_ungrouped$NotesDisplayController$setNote$(self, _cmd, fp8);  
}


        
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$NoteNavigationView = objc_getClass("NoteNavigationView"); MSHookMessageEx(_logos_class$_ungrouped$NoteNavigationView, @selector(shareButtonClicked:), (IMP)&_logos_method$_ungrouped$NoteNavigationView$shareButtonClicked$, (IMP*)&_logos_orig$_ungrouped$NoteNavigationView$shareButtonClicked$);MSHookMessageEx(_logos_class$_ungrouped$NoteNavigationView, @selector(actionSheet:didDismissWithButtonIndex:), (IMP)&_logos_method$_ungrouped$NoteNavigationView$actionSheet$didDismissWithButtonIndex$, (IMP*)&_logos_orig$_ungrouped$NoteNavigationView$actionSheet$didDismissWithButtonIndex$);Class _logos_class$_ungrouped$NoteContentLayer = objc_getClass("NoteContentLayer"); MSHookMessageEx(_logos_class$_ungrouped$NoteContentLayer, @selector(textView), (IMP)&_logos_method$_ungrouped$NoteContentLayer$textView, (IMP*)&_logos_orig$_ungrouped$NoteContentLayer$textView);Class _logos_class$_ungrouped$NotesDisplayController = objc_getClass("NotesDisplayController"); MSHookMessageEx(_logos_class$_ungrouped$NotesDisplayController, @selector(setNote:), (IMP)&_logos_method$_ungrouped$NotesDisplayController$setNote$, (IMP*)&_logos_orig$_ungrouped$NotesDisplayController$setNote$);}  }
#line 99 "/Users/tj/Documents/iOSDevelopment/NoteSaver/NoteSaver/NoteSaver.xm"
