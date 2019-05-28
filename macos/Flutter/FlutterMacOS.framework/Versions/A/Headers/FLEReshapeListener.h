// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import <Cocoa/Cocoa.h>

#if defined(FLUTTER_FRAMEWORK)
#import "flutter/shell/platform/darwin/ios/framework/Headers/FlutterMacros.h"
#else
#import "FlutterMacros.h"
#endif

/**
 * Protocol for listening to reshape events on this FlutterView.
 * Used to notify the underlying Flutter engine of the new screen dimensions.
 * Reflected from [NSOpenGLView.reshape].
 */
FLUTTER_EXPORT
@protocol FLEReshapeListener

- (void)viewDidReshape:(nonnull NSOpenGLView*)view;

@end
