//
//  ShowDetailViewController.swift
//  MovieBox
//
//  Created by Mengying Feng on 12/02/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import UIKit

class ShowDetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!

    @IBOutlet weak var titleLbl: UILabel!
    var moviePassed: Movie?
    var titlePassed: String?
    
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var linkLbl: UILabel!
    @IBOutlet weak var summaryLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        titleLbl.text = titlePassed
        titleLbl.text = moviePassed?.movieTitle
        descLbl.text = moviePassed?.movieDescription
        linkLbl.text = moviePassed?.movieLink
        detailImageView.image = moviePassed?.getMyMovieImage()
    }


//    override func viewWillAppear(animated: Bool) {
//        titleLbl.text = movie.movieTitle
//    }
//    
    
    
    
}
