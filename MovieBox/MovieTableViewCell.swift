//
//  MovieTableViewCell.swift
//  MovieBox
//
//  Created by Mengying Feng on 11/02/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var movieLink: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configCell(movie: Movie) {
        movieTitle.text = movie.movieTitle
        movieDesc.text = movie.movieDescription
        movieLink.text = movie.movieLink
        movieImg.image = movie.getMyMovieImage()
    }

}
