//
//  bookTableViewController.swift
//  finialTestBookStore
//
//  Created by Ryan on 30/1/2016.
//  Copyright © 2016 Ryan. All rights reserved.
//

import UIKit
import Parse

class bookTableViewController: UITableViewController {
    var bookArray: [PFObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: "getDataFromServer:", forControlEvents: .ValueChanged)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
       
                NSNotificationCenter.defaultCenter().addObserver(self, selector: "creatBookNoti:", name: "createBookNoti", object: nil)
        getDataFromServer(self.refreshControl!)
       
    }
    func getDataFromServer (sender: AnyObject) {
    let query = PFQuery(className: "BookStore")
    query.findObjectsInBackgroundWithBlock { (array: [PFObject]?, err: NSError?) -> Void in
        if let array = array {
            self.bookArray = array
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if self.bookArray == nil {
            return 0
        } else {
            return bookArray.count
        }
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BookSummaryTableViewCell", forIndexPath: indexPath) as! BookSummaryTableViewCell
        let book = self.bookArray[indexPath.row]
        cell.nameLabel.text = book["name"] as? String
        
        let photoFile = book["photo"] as? PFFile
        if let urlString = photoFile?.url {
            let url = NSURL(string: urlString)
            let request = NSURLRequest(URL: url!)
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data: NSData?, Response: NSURLResponse?, err: NSError?) -> Void in
                if let data = data {
                    let image = UIImage(data: data)
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        cell.bookImage.image = image
                    })
                }
            })
            task.resume()
        }
       

        return cell
    }
    func createBookNoti (noti: NSNotification) {
        let book = noti.userInfo!["book"] as! PFObject
        self.bookArray.insert(book, atIndex: 0)
        self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Automatic)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detialSegue" {
            let book = self.bookArray[self.tableView.indexPathForSelectedRow!.row]
        let vc = segue.destinationViewController as! ViewController
            vc.bookNameLabel.text = book["name"] as? String
            
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
