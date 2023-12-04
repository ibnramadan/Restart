//
//  OnboardingView.swift
//  Restart
//
//  Created by mohamed ramadan on 23/11/2023.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var buttonWidth = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0.0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var texTitle: String = "Share."
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                // MARK: Header
                Spacer()
                VStack(spacing: 0) {
                    
                    Text(texTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .transition(.opacity)
                        .id(texTitle)
                    
                    Text("""
                        It's not how much we give but
                        how much love we put into giving.
                        """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } //: End of header
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeInOut(duration: 1), value: isAnimating)
                
                
                // MARK: Center
                ZStack {
                    
                    CircleGroup(shapeColor: .white, shapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeInOut(duration: 1), value: imageOffset)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .animation(.easeInOut(duration: 0.5), value: isAnimating)
                        .gesture(
                            DragGesture()
                                .onChanged{ gesture in
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation
                                        withAnimation(.linear(duration: 0.25)) {
                                            indicatorOpacity = 0.0
                                            texTitle = "Give."
                                        }
                                    }
                                }
                                .onEnded {_ in
                                    imageOffset = .zero
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpacity = 1.0
                                        texTitle = "Share."
                                    }
                                }
                        )//: Gesture
                        .animation(.easeIn(duration: 1), value: imageOffset)
                } //: End of Center
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeInOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity)
                    , alignment: .bottom
                )
                Spacer()
                // MARK: Footer
                ZStack {
                    
                    // 1. BackGround
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    // 2. Call to Action
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .offset(x: 20)
                    // 3. Capsule(Dyanamic width)
                    
                    HStack {
                        Capsule()
                            .foregroundStyle(Color("ColorRed"))
                            .frame(width: 80 + buttonOffset)
                        Spacer()
                    }
                    // 4.Circle(Dragable)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(Color.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundStyle(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in
                                    withAnimation(.easeInOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            buttonOffset = buttonWidth - 80
                                            playSound(sound: "chimeup", type: "mp3")
                                            isOnboardingViewActive = false
                                        } else {
                                            buttonOffset = 0.0
                                        }
                                    }
                                }
                        ) //: End of gesture
                        Spacer()
                    }
                } //: Footer
                .frame(width: buttonWidth ,height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeInOut(duration: 1), value: isAnimating)
                
            } //: VStack Ending
        } //: ZStack Ending
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    OnboardingView()
}
