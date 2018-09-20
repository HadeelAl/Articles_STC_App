//
//  DetailViewController.swift
//  mytestinghere
//
//  Created by Hadeel Almushigih on 9/18/18.
//  Copyright © 2018 HALMUSHIGIH. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleImg: UIImageView!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let articleDetails = detailItem {

            if let descLabel = detailDescriptionLabel {
                descLabel.text = articleDetails.content
            }
            
            if let titleLabel = articleTitle {
                titleLabel.text = articleDetails.title
            }
            
            if let imgV = articleImg {
                
                let masterViewController: MasterViewController = MasterViewController(nibName: nil, bundle: nil)
                let cach = masterViewController.cache
                
                if let img = cach.object(forKey: articleDetails.image_url as AnyObject) {
                    
                    imgV.image = (img as! UIImage)
                }
                else {
                    DispatchQueue.global().async {
                        let downloadedimg = NSData(contentsOf: URL(string:(articleDetails.image_url)!)!)
                        DispatchQueue.main.async {
                            imgV.image = UIImage(data: downloadedimg! as Data)
                            cach.setObject(UIImage(data: downloadedimg! as Data)!, forKey: articleDetails.title as AnyObject)
                        }
                    }
                }
                
                
                
               // it ends here
            }
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var detailItem: Articles? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    
}

