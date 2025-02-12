//
//  LoadingView.swift
//  FlickrSearchApp
//
//  Created by DharmaMithra Tirunagari on 2/11/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView(Constants.UI.loadingText)
            .padding()
    }
}
