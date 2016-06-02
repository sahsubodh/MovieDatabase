//
//  DisplayMovieViewController.swift
//  MovieDatabase
//
//  Created by Subodh Sah on 5/23/16.
//  Copyright © 2016 Subodh Sah. All rights reserved.
//

import UIKit
import AlamofireImage
import Foundation
import Cosmos


var mObject:Movie!
let imageURLPrefixPoster = "https://image.tmdb.org/t/p/w185"
let imageURLPrefixBack = "https://image.tmdb.org/t/p/w300"


class DisplayMovieViewController: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var backDropImg: UIImageView!
    
    @IBOutlet weak var Lbl1: UILabel!
    
    @IBOutlet weak var Lbl2: UILabel!
    
    @IBOutlet weak var Lbl3: UILabel!
    
    @IBOutlet weak var Lbl4: UILabel!
    
    @IBOutlet weak var popularityRate: CosmosView!

    @IBOutlet weak var voteavgRate: CosmosView!
    
    @IBOutlet weak var aggrRate: CosmosView!
    
    var AggregateRating:Float!
    var imagePath = ""
    var imagePathBack = ""
    
    var index:Int=0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        
    
        
        self.navigationItem.title = movies[index].movieTitle
        
        
        
        if (movies[index].posterimgPath == nil)
        {
            self.movieImage.image = UIImage(named: "notavailable")
        }
        else
        {
            imagePath = imageURLPrefixPoster + movies[index].posterimgPath!
            
            self.movieImage.af_setImageWithURL(NSURL(string: imagePath)!)
            
            self.movieImage.contentMode = .ScaleToFill//.ScaleAspectFit
        }
        
//        if (movies[index].backdrop_path == nil)
//        {
//            self.backDropImg.image = UIImage(named: "notavailable")
//        }
//        else
//        {
//            imagePathBack =  imageURLPrefixPoster + movies[index].backdrop_path!
//            
//            self.backDropImg.af_setImageWithURL(NSURL(string: imagePath)!)
//            
//            self.backDropImg.contentMode = .ScaleToFill
//        }

        
        Lbl1.text = "Release Date:"+movies[index].releaseDate!
        Lbl2.text = "Popularity:"+String(movies[index].popularity!)
        Lbl3.text =  "Rotten Tomato Audience:"+String(movies[index].vote_average!)
        
        AggregateRating = (movies[index].popularity! + movies[index].vote_average!) / 2.0
        
        
        Lbl4.text = "Aggregate Rating:" + String(AggregateRating)
        
        // Change the cosmos view rating
        popularityRate.rating = Double(movies[index].popularity!)
        
        // Change the text
        //popularityRate.text = "Popularity"
        
        popularityRate.settings.updateOnTouch = false
        
        voteavgRate.rating = Double(movies[index].vote_average!)
        
        //voteavgRate.text = "Rotten Tomato Audience"
        
        voteavgRate.settings.updateOnTouch = false
        
        aggrRate.rating = Double(AggregateRating!)
        
        //aggrRate.text = "Aggregate Rating"
        
        aggrRate.settings.updateOnTouch = false
        
//                
//                print("mObject.releaseDate \(movies[index].releaseDate)")
//                print("mObject.popularity \(movies[index].popularity)")
//                print("vote_average \(movies[index].vote_average)")
//                
//                print("mObject is \(movies[index].description)")
//        
        
        
        
    }

}
