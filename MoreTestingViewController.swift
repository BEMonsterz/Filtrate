//
//  TestViewController.swift
//  Filtrate
//
//  Created by Bryan Ayllon on 9/6/16.
//  Copyright © 2016 Bryan Ayllon. All rights reserved.
//


import UIKit
import CoreImage

class MoreTestingViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoViews: UIImageView!
    var originalImage :UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cameraButtonPressed(){
        let imagePickerViewController =  UIImagePickerController()
        imagePickerViewController.delegate = self
        
        let alertController = UIAlertController(title: "Choose", message: nil, preferredStyle: .actionSheet)
        
        let chooseFromLibraryOption = UIAlertAction(title: "Choose from Library", style: .default) { (alert :UIAlertAction) in
            
            imagePickerViewController.sourceType = .photoLibrary
            self.present(imagePickerViewController, animated: true, completion: nil)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (alert :UIAlertAction) in
            
            
            
        }
        
        let takePictureAction = UIAlertAction(title: "Take a picture", style: .default) { (alert :UIAlertAction) in
            
            imagePickerViewController.sourceType = .camera
            self.present(imagePickerViewController, animated: true, completion: nil)
            
        }
        
        alertController.addAction(chooseFromLibraryOption)
        
        alertController.addAction(takePictureAction)
        
        alertController.addAction(cancel)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        self.originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        self.photoViews.image = self.originalImage
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func saveButton(){
        
        UIImageWriteToSavedPhotosAlbum(originalImage!, self, nil, nil)
        
    }
    
    
    
    
    
}
