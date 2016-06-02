//
//  Movie.swift
//  MovieDatabase
//
//  Created by Subodh Sah on 5/23/16.
//  Copyright © 2016 Subodh Sah. All rights reserved.
//

import UIKit
import Foundation
import Alamofire



let APIKey = "c7f84e5d552c82db83a089cb63dae9fc"
let APIurl = "https://api.themoviedb.org/3"

var movies = [Movie]()


class Movie: NSObject {
    
    var id: Int?
    var movieTitle: String?
    var posterimgPath: String?
    var releaseDate: String?
    var popularity: Float?
    var vote_average: Float?
    var backdrop_path: String?

    

    
    
    
    private var requestURLString = "\(APIurl)/discover/movie"
    
    private var parameters: Dictionary<String, AnyObject> = [
        "api_key": APIKey,
        "sort_by": "vote_count.desc"
    ]
    
    override init() {
        
    }
    
    init(movieData: NSDictionary) {
        
        self.id = movieData["id"] as? Int
        self.movieTitle = movieData["title"] as? String
        self.posterimgPath = movieData["poster_path"] as? String
        self.backdrop_path = movieData["backdrop_path"] as? String
        self.releaseDate = movieData["release_date"] as? String
        self.popularity = movieData["popularity"] as? Float
        self.vote_average = movieData["vote_average"] as? Float


    }
    
    init(searchFor: String) {
        requestURLString = "\(APIurl)/search/movie"
        parameters["query"] = searchFor
    }
    
    
    override var description : String {
        return "title is \(movieTitle)"
    }
    
    
    func fetch() {

        
        parameters["page"] = nil
        
        print(self.requestURLString)
        print(self.parameters)
        
        let request = {() -> Alamofire.Request in
            let mutableRequest = Alamofire.request(.GET, self.requestURLString, parameters: self.parameters)
                .request as! NSMutableURLRequest
            
            mutableRequest.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
            return Alamofire.request(mutableRequest)
        }()
        
        request
            .responseJSON { response in
                if let JSON = response.result.value {

                    print("JSON \(JSON)")
                    
                    movies = (JSON["results"] as! [NSDictionary]).map { movieRawData in
                        mObject = Movie(movieData: movieRawData);
                        movies.append(mObject)
                        print("movies length \(movies.count)")
                        print("mObject is \(mObject)")
                        
                        return Movie(movieData: movieRawData)
                    

                    }
                    

                }
        }
    
}

    

}
