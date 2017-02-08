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
import Mixpanel

class faceDetection: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    
    
    @IBAction func takePhoto2(_ sender: Any) {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            return
        }
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBOutlet var forHatview: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    var location = CGPoint(x: 0, y: 0)
    var hatSelected = UIImage()
    var firstSelectedHat = #imageLiteral(resourceName: "hat1")
    
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
        hatSelected = firstSelectedHat
        forHatview.image = hatSelected
        forHatview.center = CGPoint(x: 160, y: 330)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeToHatOne(_ sender: Any) {
        var hatOne = #imageLiteral(resourceName: "hat1")
        hatSelected = hatOne
        forHatview.image = hatSelected
        print("works one")
        
    }
    
    @IBAction func changeToHatTwo(_ sender: Any) {
        var hatTwo = #imageLiteral(resourceName: "hat2")
        hatSelected = hatTwo
         forHatview.image = hatSelected
        print("works 2")
    }
    
    @IBAction func changeToHatThree(_ sender: Any) {
        var hatThree = #imageLiteral(resourceName: "hat3")
        hatSelected = hatThree
         forHatview.image = hatSelected
        print("worksThree")
        
    }
    
    
    @IBAction func shareButton(_ sender: Any) {
        //Set the default sharing message.
        Mixpanel.mainInstance().track(event: "shared picture")
        let imageShare = imageView
        let message = "download app."
        //Set the link to share.
        if let link = NSURL(string: "http://yoururl.com")
        {
            let objectsToShare = [imageShare,message,link] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.addToReadingList]
            self.present(activityVC, animated: true, completion: nil)
        }
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
