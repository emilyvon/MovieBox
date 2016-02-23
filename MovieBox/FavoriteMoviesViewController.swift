//
//  ViewController.swift
//  MovieBox
//
//  Created by Mengying Feng on 11/02/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import UIKit
import CoreData

class FavoriteMoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]()
    var selectedMovie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // set nav bar image
        let logo = UIImage(named: "Movie-Box")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        
        //         set a clear background of the nav bar
        //        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        //        self.navigationController!.navigationBar.shadowImage = UIImage()
        //        self.navigationController!.navigationBar.translucent = true
        //        self.navigationController!.view.backgroundColor = UIColor.clearColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        
        //get data and set up array list
        fetchAndSetResults()
        //reload data everytime when view appears
        tableView.reloadData()
        
        
    }
    
    func fetchAndSetResults() {
        // get app delegate
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        //get context
        let context = app.managedObjectContext
        //get data
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        
        //execution can fail, use do catch
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.movies = results as! [Movie]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    


    
    // pass selcted data to new controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
//            print("open ShowDetail")
            if let destination = segue.destinationViewController as? ShowDetailViewController {
                selectedMovie = movies[(tableView.indexPathForSelectedRow?.row)!]
                print("Movie title : \(selectedMovie.movieTitle)")
                destination.moviePassed = selectedMovie
                destination.titlePassed = selectedMovie.movieTitle!
                
            }
            tableView.deselectRowAtIndexPath(tableView.indexPathForSelectedRow!, animated: true)
        }
        
        if segue.identifier == "AddNew" {
            if let destination = segue.destinationViewController as? AddNewMovieViewController {
//                print("open AddNew")
            }
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieTableViewCell {
            let movie = movies[indexPath.row]
            cell.configCell(movie)
            return cell
        } else {
            return MovieTableViewCell()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
}

