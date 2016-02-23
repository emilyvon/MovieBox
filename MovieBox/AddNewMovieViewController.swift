//
//  AddNewMovieViewController.swift
//  MovieBox
//
//  Created by Mengying Feng on 11/02/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import UIKit
import CoreData

class AddNewMovieViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var linkTextField: UITextField!
    @IBOutlet weak var summaryTextView: UITextView!
    
    var imagePicker: UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //BBBAC2
        summaryTextView.text = "Plot summary: \n"
        summaryTextView.textColor = UIColor.blackColor()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addImageButtonPressed(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        // dismiss
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        //set movieImg to the new image picked
        movieImg.image = image
    }
    
    @IBAction func createBtnPressed(sender: AnyObject) {
        // save data to array
        // make sure there is a title and a description
        if let title = titleTextField.text where title != "", let desc = descTextField.text where desc != "", let img = movieImg.image {
            //get app delegate
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
            
            
            movie.movieTitle = title
            movie.movieDescription = desc
            movie.movieLink = linkTextField.text
            movie.setMyMovieImage(img)
            
            
            
            context.insertObject(movie)
            do {
                try context.save()
            } catch {
                print("could not save movie")
            }
            
            // go back to list
            self.navigationController?.popViewControllerAnimated(true)
            
            
        } else {
            let alert = UIAlertController(title: "", message: "Image, title and description cannot be empty", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        
    }
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        // go back to list
        self.navigationController?.popViewControllerAnimated(true)
        
    }
}
