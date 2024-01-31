//
//  DetailMovieViewModel.swift
//  UiKit_MVVM_Xib
//
//  Created by Devin Maleke on 24/01/24.
//

import Foundation

class DetailMovieViewModel {
    
    var movie: Movie
    var movieImage: URL?
    var movieTitle: String
    var movieDesc: String
    var movieID: Int
    
    init(movie: Movie) {
        self.movie = movie
        self.movieID = movie.id
        self.movieTitle = movie.title ?? movie.name ?? ""
        self.movieDesc = movie.overview ?? ""
        self.movieImage = makeImageURL(movie.backdropPath ?? "")
    }
    
    private func makeImageURL( _ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
