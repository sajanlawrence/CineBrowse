//
//  MovieRepository.swift
//  CineBrowse
//
//  Created by Sajan Lawrence on 18/10/25.
//

import Foundation
import Observation

@Observable
class MovieRepository{
    var allMovies: [Movie] = []
    var displayedMovies: [Movie] = []
    var searchText = ""
    private var currentPage = 0
    private let pageSize = 20
    var filteredMovies: [Movie]{
        if searchText.isEmpty{
            displayedMovies
        }else{
            allMovies.filter({ $0.originalTitle.localizedStandardContains(searchText)})
        }
    }
    
    func fetchAllMovies() async{
        guard let url = URL(string: "https://jsonfakery.com/movies/random/300") else { return }
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([Movie].self, from: data)
            await MainActor.run {
                allMovies = decoded
                currentPage = 0
                loadNextMovies()
            }
        }catch let DecodingError.keyNotFound(key, context) {
            print("Missing key: \(key.stringValue) – \(context.debugDescription)")
        } catch let DecodingError.valueNotFound(value, context) {
            print("Missing value: \(value) – \(context.debugDescription)")
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type mismatch for type \(type) – \(context.debugDescription)")
        } catch let DecodingError.dataCorrupted(context) {
            print("Data corrupted – \(context.debugDescription)")
        } catch {
            print("Unknown decoding error: \(error)")
        }

    }
    
    func loadNextMovies(){
        guard searchText.isEmpty else { return }
        let start = currentPage * pageSize
        let end = min(start + pageSize, allMovies.count)
        guard start < allMovies.count else { return }
        displayedMovies.append(contentsOf: allMovies[start..<end])
        currentPage += 1
    }
}
