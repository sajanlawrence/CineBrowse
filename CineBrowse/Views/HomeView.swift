//
//  HomeView.swift
//  CineBrowse
//
//  Created by Sajan Lawrence on 18/10/25.
//

import SwiftUI

struct HomeView: View {
    @State private var repo = MovieRepository()
    private let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var selectedMovie: Movie?
    @State private var hasLoaded: Bool = false
    var body: some View {
        NavigationStack{
            VStack {
                ScrollView{
                    LazyVGrid(columns: columns) {
                        ForEach(repo.filteredMovies) { movie in
                            MovieGridItemView(movie: movie)
                                .onAppear {
                                    isLastMovie(movie: movie)
                                }
                                .onTapGesture {
                                    selectedMovie = movie
                                }
                        }
                    }
                    .padding(.horizontal, 12)
                }
                .frame(maxWidth: .infinity, alignment: .top)
            }
            .navigationTitle("CineBrowse")
            .navigationSubtitle("Browse, Discover, and Dive Into Your Next Favourite Movie")
            .task {
                if !hasLoaded{
                    print("onappear called")
                    await repo.fetchAllMovies()
                    hasLoaded = true
                }
            }
            .searchable(text: $repo.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search movies...")
            .navigationDestination(item: $selectedMovie) { movie in
                MovieDetailView(movie: movie)
            }
        }
    }
    
    func isLastMovie(movie: Movie){
        if movie == repo.displayedMovies.last && repo.searchText.isEmpty{
            repo.loadNextMovies()
        }
    }
}

#Preview {
    HomeView()
}
