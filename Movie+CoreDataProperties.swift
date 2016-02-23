//
//  Movie+CoreDataProperties.swift
//  MovieBox
//
//  Created by Mengying Feng on 11/02/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var movieDescription: String?
    @NSManaged var movieImage: NSData?
    @NSManaged var movieLink: String?
    @NSManaged var movieTitle: String?

}
