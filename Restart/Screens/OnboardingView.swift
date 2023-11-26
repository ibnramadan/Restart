//
//  OnboardingView.swift
//  Restart
//
//  Created by mohamed ramadan on 23/11/2023.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                // MARK: Header
                Spacer()
                VStack(spacing: 0) {
                    
                    Text("Share")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                    
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
                .multilineTextAlignment(.center)
                // MARK: Center
                ZStack {
                    ZStack {
                        Circle()
                            .stroke(.white.opacity(0.2), lineWidth: 40)
                            .frame(width: 260, height: 260, alignment: .center)
                        Circle()
                            .stroke(.white.opacity(0.2), lineWidth: 80)
                            .frame(width: 260, height: 260, alignment: .center)
                    }
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }
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
                            .frame(width: 80)
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
                        Spacer()
                    }
                } .frame(height: 80, alignment: .center)
                    .padding()
                    .onTapGesture {
                        isOnboardingViewActive = false
                    }
                
            } //: VStack Ending
        } //: ZStack Ending
    }
}

#Preview {
    OnboardingView()
}
