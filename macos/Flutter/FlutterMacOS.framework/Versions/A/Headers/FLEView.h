// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import <Cocoa/Cocoa.h>

#import "FLEOpenGLContextHandling.h"
#import "FLEReshapeListener.h"

#if defined(FLUTTER_FRAMEWORK)
#import "flutter/shell/platform/darwin/ios/framework/Headers/FlutterMacros.h"
#else
#import "FlutterMacros.h"
#endif

/**
 * View capable of acting as a rendering target and input source for the Flutter
 * engine.
 */
FLUTTER_EXPORT
@interface FLEView : NSOpenGLView <FLEOpenGLContextHandling>

/**
 * Listener for reshape events. See protocol description.
 */
@property(nonatomic, weak, nullable) IBOutlet id<FLEReshapeListener> reshapeListener;

@end
