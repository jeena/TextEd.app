//
//  Document.m
//  TextEd
//
//  Created by Jeena on 2014-01-21.
//  Copyright (c) 2014 Jeena. All rights reserved.
//

#import "Document.h"

@implementation Document
@synthesize textView;
@synthesize stringModel;

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    [self.textView setFont:[NSFont userFixedPitchFontOfSize:[[NSUserDefaults standardUserDefaults] integerForKey:@"fontSize"]]];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    NSData *data = [[self.textView.textStorage string] dataUsingEncoding:NSUTF8StringEncoding];
    [self.textView breakUndoCoalescing];
    
    if (!data && outError) {
        *outError = [NSError errorWithDomain:NSCocoaErrorDomain code:NSFileWriteUnknownError userInfo:nil];
    }
    
    return data;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    self.stringModel = [[NSAttributedString alloc] initWithString:[NSString stringWithUTF8String:[data bytes]]];
    return !!self.stringModel;
}

@end
