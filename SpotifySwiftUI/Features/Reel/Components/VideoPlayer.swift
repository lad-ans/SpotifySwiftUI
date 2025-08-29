import SwiftUI
import AVKit

struct VideoPlayer: View {
    let geometry: GeometryProxy
    @Binding var reel: Reel
    @Binding var likedCounter: [Like]
    @Binding var showTabBar: Bool
    @Binding var selected: SpotifyTabItem
    
    @State var player: AVPlayer?
    @State var looper: AVPlayerLooper?
    
    var body: some View {
        GeometryReader{
            let rect = $0.frame(in: .scrollView(axis: .vertical))
            
            ZStack {
                VideoPlayerViewController(player: $player)
                    .preference(key: OffsetKey.self, value: rect)
                    .onPreferenceChange(OffsetKey.self, perform: { _ in
                        playPause(rect, tab: selected)
                    })
                    .preference(key: TabKey.self, value: selected)
                    .onPreferenceChange(TabKey.self, perform: { _ in
                        playPause(rect, tab: selected)
                    })
                
                Color.spotifyBlack.opacity(0.0000001)
                    .onTapGesture(perform: onTapGesture)
                    .onTapGesture(count: 2, perform: onDoubleTapGesture)
                    .onAppear(perform: onAppear)
                    .onDisappear(perform: onDisapear)
            }
        }
    }
}

#Preview {
    GeometryReader {
        ReelView(
            geometry: $0,
            showTabBar: .constant(true),
            selected: .constant(.reels)
        )
    }
}
