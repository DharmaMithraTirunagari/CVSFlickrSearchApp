//
//  ErrorView.swift
//  FlickrSearchApp
//
//  Created by DharmaMithra Tirunagari on 2/11/25.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    let retryAction: () -> Void

    var body: some View {
        VStack(spacing: 10) {
            Text(Constants.UI.errorTitle)
                .font(.headline)
                .foregroundColor(.red)
            
            Text(message)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()

            Button(action: retryAction) {
                Text(Constants.UI.retryButtonTitle)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)
        }
        .applyCardStyle() // Uses our View Extension
    }
}

