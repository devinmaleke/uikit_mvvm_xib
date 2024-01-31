//
//  NetworkConstant.swift
//  UiKit_MVVM_Xib
//
//  Created by Devin Maleke on 23/01/24.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        //Singleton
    }
    
    public var apiKey: String {
        get {
            //API KEY
            return "82b6a07d7bd363b79395a58e6bea0c93"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get{
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
    
}
