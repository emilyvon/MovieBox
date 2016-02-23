//
//  Movie.swift
//  MovieBox
//
//  Created by Mengying Feng on 11/02/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Movie: NSManagedObject {


    func setMyMovieImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.movieImage = data
    }

    func getMyMovieImage() -> UIImage {
        return UIImage(data: self.movieImage!)!
    }
}
