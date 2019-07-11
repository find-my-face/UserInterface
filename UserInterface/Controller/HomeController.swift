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

class HomeController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var ref: DatabaseReference?
    var ImageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ref = Database.database().reference()
        imagePicker.delegate = self
        
        view.backgroundColor = UIColor(r: 61, g: 91, b: 60)
        view.addSubview(loadImageButton)
        setupLoadImageButton()

    }
    
    var loadImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("Upload Photo", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handlePicker), for: .touchUpInside)
        return button
    }()
    
    
    
    func setupLoadImageButton() {
        //need x, y, width, height constraints
        loadImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadImageButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadImageButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        loadImageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
    
    //create image picker
    @objc func handlePicker() {
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        //display image picker
        self.present(imagePicker, animated: true)
    }

    //pick photo
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        ImageView.image = image
            //send image to firebase?
           // ImageView.contentMode = .scaleAspectFit

        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

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
