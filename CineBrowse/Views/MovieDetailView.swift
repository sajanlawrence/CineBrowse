//
//  MovieDetailView.swift
//  CineBrowse
//
//  Created by Sajan Lawrence on 19/10/25.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    @Environment(\.colorScheme) var colorScheme
    let movie: Movie
    var body: some View {
        VStack{
            ScrollView{
                imageView
                titleView
                overviewView
                Divider()
                infoView
                Divider()
                castView
                CastListView(casts: movie.casts)
                    .frame(height: 170)
                    .padding(.leading)
            }
        }
    }
}

extension MovieDetailView{
    private var imageView: some View{
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
            .frame(width: 300, height: 250)
            .clipped()
            .padding()
            .shadow(color: colorScheme == .dark ? .white : .black, radius: 15)
    }
    
    private var titleView: some View{
        Text(movie.originalTitle)
            .font(.title2)
            .bold()
            .lineLimit(2)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .padding(10)
    }
    
    private var overviewView: some View{
        Text(movie.overview)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 10)
            .font(.subheadline)
            .foregroundStyle(.secondary)
    }
    
    private var infoView: some View{
        HStack(spacing: 100) {
            VStack(alignment: .leading, spacing: 12) {
                InfoRow(label: "Original Language", value: movie.originalLanguage.uppercased(), systemImage: "globe")
                InfoRow(label: "Popularity", value: String(format: "%.2f", movie.popularity), systemImage: "star.fill")
                InfoRow(label: "Release Date", value: movie.releaseDate?.formattedMovieDate ?? "NA", systemImage: "calendar")
            }
            .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 12) {
                InfoRow(label: "Vote Average", value: String(format: "%.2f", movie.voteAverage), systemImage: "hand.thumbsup.fill")
                InfoRow(label: "Vote Count", value: "\(movie.voteCount)", systemImage: "number")
               Spacer()
            }
            .padding(.vertical)
        }
    }
    
    private var castView: some View {
        HStack(alignment: .center) {
            Text("Cast")
                .padding(.leading)
                .padding(.top, 2)
                .font(.title2)
            Spacer()
        }
    }
}

#Preview {
    MovieDetailView(movie: .default)
}
