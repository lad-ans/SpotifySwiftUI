//
//  SideMenu.swift
//  SpotifyClone
//
//  Created by  on 23/08/25.
//

import SwiftUI

struct SideMenu: View {
    @Binding var showMenu: Bool
    let geometry: GeometryProxy
    @EnvironmentObject var userStore: UserStore
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Spacer()
                .frame(height: 30 + geometry.safeAreaInsets.top)
            
            VStack(alignment: .leading, spacing: 14) {
                AsyncImage(url: URL(string: userStore.currentUser?.image ?? Constants.randomImage))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
                Text(userStore.currentUser?.firstName ?? "--")
                    .font(.title2.bold())
                    .foregroundStyle(.spotifyWhite)
                
                Text("@\(userStore.currentUser?.username ?? "--")")
                    .font(.callout)
                    .foregroundStyle(.spotifyLightGrey)
                
                HStack(spacing: 12) {
                    Button {
                        
                    } label: {
                        Label {
                            Text("Followers")
                                .font(.callout)
                        } icon: {
                            Text("189")
                                .font(.callout)
                                .fontWeight(.bold)
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        Label {
                            Text("Following")
                                .font(.callout)
                        } icon: {
                            Text("1.2 M")
                                .font(.callout)
                                .fontWeight(.bold)
                        }
                    }
                }
                .foregroundStyle(.spotifyWhite)
            }
            .padding(.bottom, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
                .background(.spotifyGrey)
            
            VStack(alignment: .leading, spacing: 30) {
                TabButton(title: "Profile", image: "person")
                
                TabButton(title: "Lists", image: "list.bullet.rectangle")
                
                TabButton(title: "Bookmarks", image: "bookmark")
                
                TabButton(title: "Purchases", image: "cart")
                
                TabButton(title: "Monetization", image: "dollarsign")
            }
            .padding(.top, 20)
            
            VStack(alignment: .leading, spacing: 14) {
                Spacer()
                
                Divider()
                    .background(.spotifyGrey)
                
                TabButton(title: "Spotify Ads", image: "square.and.arrow.up")
                    .padding(.vertical, 10)
                
                Divider()
                    .background(.spotifyGrey)
                
                Button("Settings And Privacy") {
                    
                }
                .foregroundStyle(.spotifyWhite)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                    .background(.spotifyGrey)
                
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "sun.max")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "calendar.day.timeline.trailing")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 18, height: 18)
                    }
                }
                .foregroundStyle(.spotifyGreen)
                .padding([.vertical, .trailing])
            }
        }
        .padding(.horizontal, geometry.safeAreaInsets.leading + 20)
        .ignoresSafeArea(.container, edges: .horizontal)
        .background(Color.spotifyDarkGrey)
        .frame(maxWidth: geometry.sideMenuWidth, alignment: .leading)
    }
    
    func TabButton(
        title: String,
        image: String,
        size: CGFloat? = nil,
    ) -> some View {
        Button {
            showAlert.toggle()
        } label: {
            HStack(spacing: 14) {
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size ?? 16, height: size ?? 16)
                
                Text(title)
            }
            .foregroundStyle(.spotifyWhite)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .popView(isPresented: $showAlert) {
            
        } content: {
            AlertContent(show: $showAlert, title: title) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    showAlert = true
                }
            }
        }
    }
}

#Preview {
    GeometryReader { geometry in
        SideMenu(
            showMenu: .constant(false),
            geometry: geometry,
        )
        .environmentObject(UserStore())
    }
}
