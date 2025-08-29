//
//  CustomVideoPlayer.swift
//  SpotifySwiftUI
//
//  Created by ladans on 28/08/25.
//

import SwiftUI
import AVKit

struct VideoPlayerViewController: UIViewControllerRepresentable {
    @Binding var player: AVPlayer?
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.videoGravity = .resizeAspectFill
        controller.showsPlaybackControls = false
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        uiViewController.player = player
    }
}
