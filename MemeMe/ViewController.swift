//
//  ViewController.swift
//  MemeMe
//
//  Created by Julia Will on 31.07.15.
//  Copyright (c) 2015 Julia Will. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topText: UITextField!
    @IBOutlet weak var bottomText: UITextField!
    
    let memeFieldDelegate = MemeTextFieldDelegate()
    
    override func viewWillAppear(animated: Bool) {
         cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        topText.delegate = memeFieldDelegate
        bottomText.delegate = memeFieldDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func pickImageFromAlbum(sender: AnyObject) {
        openImagePicker("Album")
    }
    
    @IBAction func pickImageFromCamera(sender: AnyObject) {
        openImagePicker("Camera")
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = image
            self.topText.text = "TOP"
            self.bottomText.text = "BOTTOM"
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func openImagePicker(source: String) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = source == "Album" ? UIImagePickerControllerSourceType.PhotoLibrary : UIImagePickerControllerSourceType.Camera
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    

}

