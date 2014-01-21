//
//  Document.h
//  TextEd
//
//  Created by Jeena on 2014-01-21.
//  Copyright (c) 2014 Jeena. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument {
    NSAttributedString *stringModel;
}

@property (unsafe_unretained) IBOutlet NSTextView *textView;
@property (nonatomic, readwrite) NSAttributedString *stringModel;

@end
