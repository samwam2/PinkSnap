//
//  ViewController.swift
//  PussyHatApp
//
//  Created by Sam Showalter on 2/4/17.
//  Copyright © 2017 Sam Showalter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func Website(_ sender: Any) {
        if let url = NSURL(string:"https://www.instagram.com/accounts/login/"){
            UIApplication.shared.openURL(url as URL)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

