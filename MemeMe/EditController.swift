//
//  EditController.swift
//  MemeMe
//
//  Created by Julia Will on 31.07.15.
//  Copyright (c) 2015 Julia Will. All rights reserved.
//

import UIKit

class EditController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topText: UITextField!
    @IBOutlet weak var bottomText: UITextField!
    
    let memeFieldDelegate = MemeTextFieldDelegate()
    
    // Holds the final MemeObject
    var memeImage: UIImage!
    
    override func viewWillAppear(animated: Bool) {
         cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        topText.delegate = memeFieldDelegate
        bottomText.delegate = memeFieldDelegate
        subscribeToKeyboardNotifications()
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        unsubscribeFromKeyboardNotifications()
    }
 
    @IBAction func pickImageFromAlbum(sender: AnyObject) {
        openImagePicker("Album")
    }
    
    @IBAction func pickImageFromCamera(sender: AnyObject) {
        openImagePicker("Camera")
    }
    
    @IBAction func shareMeme(sender: AnyObject) {
        save()
    }
    
    
    /**
    Handle image picking
    */
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = image
            self.topText.text = "TOP"
            self.bottomText.text = "BOTTOM"
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func openImagePicker(source: String) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = source == "Album" ? UIImagePickerControllerSourceType.PhotoLibrary : UIImagePickerControllerSourceType.Camera
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    /**
    Handle Keyboard showing
    */
    func subscribeToKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:"    , name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    func unsubscribeFromKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name:
            UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        //only move view up when editing the bottom textfield
        if (bottomText.editing) {
            self.view.frame.origin.y -= getKeyboardHeight(notification)
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if (bottomText.editing) {
            self.view.frame.origin.y += getKeyboardHeight(notification)
        }
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.CGRectValue().height
    }
    
    /**
    save a Meme
    */
    func save() {
        memeImage = generateMemedImage()
        var memeObject = MemeModel(topText: topText.text, bottomText: bottomText.text, originalImage: imageView.image!, memeImage: memeImage)
    }
    
    func generateMemedImage() -> UIImage
    {
        // Hide Toolbar and NavigationBar
        self.navigationController?.setToolbarHidden(true, animated: false)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        self.view.drawViewHierarchyInRect(self.view.frame,
            afterScreenUpdates: true)
        let memedImage : UIImage =
        UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Now show tool- and navigation bar again
        self.navigationController?.setToolbarHidden(false, animated: false)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        return memedImage
    }
}

