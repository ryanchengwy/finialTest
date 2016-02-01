//
//  ViewController.swift
//  finialTestBookStore
//
//  Created by Ryan on 28/1/2016.
//  Copyright © 2016 Ryan. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {
    var bookImageString :String?
    var websiteUrl : String?
    var bookWebsite : String?
    var bookAddress : String?
    

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var bookPhoneButton: UIButton!
    @IBAction func bookPhoneButtonPressed(sender: AnyObject) {
    }
    @IBAction func bookAddressButtonPressed(sender: AnyObject) {
    }
    @IBAction func bookWebsiteButtonPressed(sender: AnyObject) {
        let safariViewController = SFSafariViewController(URL:NSURL(string: self.websiteUrl!)!, entersReaderIfAvailable: true)
        self.presentViewController(safariViewController, animated: true, completion: nil)
    }
    @IBOutlet weak var phoneWebsiteButton: UIButton!
    @IBOutlet weak var phoneAddressButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

