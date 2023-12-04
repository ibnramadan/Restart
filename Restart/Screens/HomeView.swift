//
//  HomeView.swift
//  Restart
//
//  Created by mohamed ramadan on 23/11/2023.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            //: MARK: HEADER
            ZStack {
                CircleGroup(shapeColor: .gray, shapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        .easeInOut(duration: 4)
                        .repeatForever()
                        , value: isAnimating)
            }
            
            //: MARK: Centerr
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            //: MARK: FOOTER
            ZStack {
                Button {
                    withAnimation {
                        playSound(sound: "success", type: "m4a")
                        isOnboardingViewActive = true
                    }
                } label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Restart")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                }.buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                
            }
        } //: VStack End
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}

#Preview {
    HomeView()
}
