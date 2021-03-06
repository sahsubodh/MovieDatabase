//
//  MovieListTableViewController.swift
//  MovieDatabase
//
//  Created by Subodh Sah on 5/24/16.
//  Copyright © 2016 Subodh Sah. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {

    var index:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.backgroundColor = UIColor(red: 0/255, green: 7.0/255, blue: 28.0/255, alpha: 1.0)
        self.tableView.separatorColor = UIColor.clearColor()
        
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        self.navigationItem.title = "Search Results"
        self.tableView.separatorColor = UIColor.darkGrayColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:MovieCell = tableView.dequeueReusableCellWithIdentifier("cell") as! MovieCell

        // Configure the cell...
    
        
        cell.movieName.text = movies[indexPath.row].movieTitle
        cell.releaseDateLbl.text = movies[indexPath.row].releaseDate
        
        print(movies[indexPath.row].posterimgPath)
        
        if (movies[indexPath.row].posterimgPath == nil)
        {
            cell.moviePoster.image = UIImage(named: "notavailable")
        }
        else
        {
            cell.moviePoster.af_setImageWithURL(NSURL(string: imageURLPrefixPoster + movies[indexPath.row].posterimgPath!)!)
          
            cell.moviePoster.contentMode = .ScaleAspectFill
        }
        

        return cell
    }
 
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let cell:MovieCell = tableView.dequeueReusableCellWithIdentifier("cell") as! MovieCell
        
        index = indexPath.row
        
        self.performSegueWithIdentifier("gotoMovie", sender: self)
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
                if (segue.identifier == "gotoMovie") {
        
                let svc = segue.destinationViewController as! DisplayMovieViewController;
        
                    svc.index = index;
        
                }
        
    }
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
