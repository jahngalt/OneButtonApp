//
//  ViewController.swift
//  OneButtonApp
//
//  Created by Oleg Kudimov on 2/11/19.
//  Copyright © 2019 Oleg Kudimov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAler(){
        let alert = UIAlertController(title: "Hello, World", message: "This is my first app!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

