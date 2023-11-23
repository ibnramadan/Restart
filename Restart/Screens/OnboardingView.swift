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
        VStack(spacing: 20) {
            Text("Inboarding")
                .font(.largeTitle)
            Button(action: {
                isOnboardingViewActive = false
            }, label: {
                Text("Start")
            })
        } //: VStack Ending
    }
}

#Preview {
    OnboardingView()
}
