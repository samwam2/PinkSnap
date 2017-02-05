//
//  faceDetection.swift
//  PussyHatApp
//
//  Created by ShowalterS18 on 2/4/17.
//  Copyright © 2017 Sam Showalter. All rights reserved.
//

import Foundation
import CoreImage
import UIKit

class faceDetection: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
      @IBOutlet var imageView: UIImageView!
    
    @IBAction func takePhoto(_ sender: Any) {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            return
        }
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
        
        //imagePickerController(imagePicker, didFinishPickingMediaWithInfo: "no")
    }
    
    @IBOutlet var forHatview: UIImageView!
    let imagePicker = UIImagePickerController()
    
    var location = CGPoint(x: 0, y: 0)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch : UITouch = touches.first as UITouch!
        location = touch.location(in: self.view)
        forHatview.center = location
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch : UITouch = touches.first as UITouch!
        location = touch.location(in: self.view)
        forHatview.center = location
    }
    
    
//    func moveHatImage() {
//        let rect = CGRect(x: 0, y: 0, width: 100, height: 100) // CGFloat, Double, Int
//        var hatView = UIImageView(frame: rect)
//        hatView.image = UIImage(named: "hat")
//        hatView.contentMode = .scaleToFill
//        hatView.isUserInteractionEnabled = true
//    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
       // self.detect()
        forHatview.center = CGPoint(x: 160, y: 330)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        //forHatview.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
} // last clossing braket for the class
