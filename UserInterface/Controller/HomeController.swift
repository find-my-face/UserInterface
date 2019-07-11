//
//  HomeController.swift
//  UserInterface
//
//  Created by Laura Quinn on 2019-07-11.
//  Copyright © 2019 find-my-face. All rights reserved.
//

import Foundation

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

class HomeController: UIViewController {
    
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ref = Database.database().reference()
        
        view.backgroundColor = UIColor(r: 61, g: 91, b: 60)

    }
    
//    var pickImageButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
//        button.setTitle("Upload Photo", for: UIControl.State())
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitleColor(UIColor.white, for: UIControl.State())
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//
//        button.addTarget(self, action: #selector(imagePicker), for: .touchUpInside)
//
//
//        return button
//    }()
    
//    //create image picker
//    @objc func imagePicker() {
//        let image = UIImagePickerController()
//        image.delegate = self
//        image.sourceType = UIImagePickerController.SourceType.photoLibrary
//        //display image picker
//        self.present(image, animated: true)
//    }
//
//    //pick photo
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            //send image to firebase?
//            return
//        }
//
//        self.dismiss(animated: true, completion: nil)
//    }
    
}

//extension HomeController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func setupImagePicker(){
//        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
//            imagePicker.sourceType = .savedPhotosAlbum
//            imagePicker.delegate = self
//            imagePicker.isEditing = true
//
//            self.present(imagePicker, animated: true, completion: nil)
//        }
//    }
//}
