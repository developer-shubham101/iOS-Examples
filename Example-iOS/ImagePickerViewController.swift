//
//  ImagePickerViewController.swift
//  Example-iOS
//
//  Created by Arka Softwares on 14/06/19.
//  Copyright © 2019 Arka Softwares. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeImage(_ sender: Any) {
        let alertController = UIAlertController(title: "Choose Profile Picture" , message: "", preferredStyle: .actionSheet)
        
        let cameraButton = UIAlertAction(title: "Camera" , style: .default, handler: { (action) -> Void in
            self.openCamera()
        })
        
        let  galleryButton = UIAlertAction(title: "Gallery" , style: .default, handler: { (action) -> Void in
            self.openPhotoLibrary()
        })
        
        let cancelButton = UIAlertAction(title: "Cancel" , style: .cancel, handler: { (action) -> Void in
        })
        
        alertController.addAction(cameraButton)
        alertController.addAction(galleryButton)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension ImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    fileprivate func openCamera() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerController.SourceType.camera
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    fileprivate func openPhotoLibrary() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // The info dictionary contains multiple representations of the image, and this uses the original. 
        let selectedImage : UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        
        // Set image on ImageView
        imageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
}
