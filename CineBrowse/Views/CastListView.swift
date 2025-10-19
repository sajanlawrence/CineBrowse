//
//  CardListView.swift
//  CineBrowse
//
//  Created by Sajan Lawrence on 19/10/25.
//

import SwiftUI

struct CastListView: View {
    let casts: [Cast]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16){
                ForEach(casts) { cast in
                    CastRowView(cast: cast)
                }
            }
        }
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    CastListView(casts: [.default, .default, .default])
}
