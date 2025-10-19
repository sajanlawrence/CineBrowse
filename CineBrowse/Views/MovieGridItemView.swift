//
//  MovieGridItemView.swift
//  CineBrowse
//
//  Created by Sajan Lawrence on 18/10/25.
//

import SwiftUI
import Kingfisher

struct MovieGridItemView: View {
    let movie: Movie
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(spacing: 0){
            KFImage(URL(string: movie.posterPath))
                .placeholder {
                    Color.gray.opacity(0.3)
                        .overlay {
                            ProgressView()
                        }
                }
                .cancelOnDisappear(true)
                .resizable()
                .scaledToFit()
                .cornerRadius(15)
                .frame(maxWidth: .infinity)
                .frame(height: 140, alignment: .top)
                .clipped()
                .shadow(color: colorScheme == .dark ? .white : .black, radius: 3)
                
            Text(movie.originalTitle)
                .font(.footnote)
                .bold()
                .lineLimit(2)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding(.vertical, 8)
        }
    }
}

#Preview {
    MovieGridItemView(movie: .default)
}
