//
//  ViewController.swift
//  MovieDatabase
//
//  Created by Subodh Sah on 5/23/16.
//  Copyright © 2016 Subodh Sah. All rights reserved.
//

import UIKit
import Foundation



class ViewController: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var searchMovie: UISearchBar!

    var movieObject = Movie()
    
    let gotoMovieSegue = "gotoMovieList"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        searchMovie.delegate = self
        searchMovie.barStyle = .Black
        //searchMovie.barStyle = UIBarStyle.r
        searchMovie.placeholder = "Search for a movie"
        searchMovie.enablesReturnKeyAutomatically = false
        
        
    }
    
    
    // MARK: SearchBar event handlers
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
        
        print("searchBarSearchButtonClicked called \(searchMovie.text!)")
        
        movieObject = searchMovie.text! != "" ?
            Movie(searchFor: searchMovie.text!) :
            Movie()
        
        
        movieObject.fetch()
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationItem.title = "Movie Database"

        
    }

    @IBAction func gotoMovie(sender: AnyObject) {
        
        self.performSegueWithIdentifier(gotoMovieSegue, sender: nil)
        
    }
    
    
    
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        if (segue.identifier == gotoMovieSegue) {
//            
//        let svc = segue.destinationViewController as! DisplayMovieViewController;
//            
//            mObject = self.movieObject;
//        
//        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

