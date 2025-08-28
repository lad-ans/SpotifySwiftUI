//
//  GeometryProxy.Extensions
//  SpotifySwiftUI
//
//  Created by ladans on 28/08/25.
//

import SwiftUI

extension GeometryProxy {
    var width: CGFloat { size.width }
    var height: CGFloat { size.height }
    var isLargeScreen: Bool { width > ScreenConstraints.largeScreenBreakpoint || width > height }
    var sideMenuWidth: CGFloat { isLargeScreen ? ScreenConstraints.largeScreenSideBarMaxWidth : width * 0.8 }
}
