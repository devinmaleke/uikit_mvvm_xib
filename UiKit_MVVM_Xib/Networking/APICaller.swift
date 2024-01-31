//
//  APICaller.swift
//  UiKit_MVVM_Xib
//
//  Created by Devin Maleke on 23/01/24.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case cantParseData
}
public class APICaller {
    
    static func getTrendingMovies (
        completionHandler: @escaping (_ result: Result<TrendingMovieModel, NetworkError>) -> Void) {
        
            let urlString = NetworkConstant.shared.serverAddress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
            
            guard let url = URL(string: urlString) else {
                completionHandler(.failure(.urlError))
                return
            }
            
            URLSession.shared.dataTask(with: url) { dataResponse, URLResponse, error in
                
                if error == nil,
                   let data = dataResponse,
                   let resultData = try? JSONDecoder().decode(TrendingMovieModel.self, from: data){
                    completionHandler(.success(resultData))
                }else{
                    completionHandler(.failure(.cantParseData))
                }
                
            }.resume()
    }
    
    
    
}
