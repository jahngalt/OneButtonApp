//
//  AboutViewController.swift
//  OneButtonApp
//
//  Created by Oleg Kudimov on 2/15/19.
//  Copyright © 2019 Oleg Kudimov. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    //adding action to "Close" button in AboutViewController
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url  = Bundle.main.url(forResource: "BullsEye",
                                      withExtension: "html"){
            let request = URLRequest(url:url)
            webView.load(request)
        }
    }
}
