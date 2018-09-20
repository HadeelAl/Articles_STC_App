//
//  MasterViewController.swift
//  mytestinghere
//
//  Created by Hadeel Almushigih on 9/18/18.
//  Copyright © 2018 HALMUSHIGIH. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    
    var cache = NSCache<AnyObject, AnyObject>()
    var detailViewController: DetailViewController? = nil
    var naVigationBartitle: String?
    var articleList : [Articles] = [Articles]()
    
    
    func startfunc() {
        let userText = "https://no89n3nc7b.execute-api.ap-southeast-1.amazonaws.com/staging/exercise"
        
        //    let userText = gitUname.text?.lowercased()
        
        guard let jsonUrl = URL(string:userText) else {
            return }
        
        URLSession.shared.dataTask(with: jsonUrl) { (data, response
            , error) in
            
            guard let data = data else { return }
            do {
                
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(URLResponse.self, from: data)
                
                DispatchQueue.main.sync {
                    
                    self.naVigationBartitle = jsonData.title
                    self.navigationItem.title = jsonData.title
                    self.articleList = jsonData.articles!
                    
                    self.refreshTable()
                    
                }
                
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
    
    
    override func viewDidLoad() {
        startfunc()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Set UITableViewCells height to Auto
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200

        
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:  #selector(reloadData), for: UIControlEvents.valueChanged)
        self.refreshControl = refreshControl
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let article = articleList[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = article
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell : CustomCell = self.tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        
        print("\(#function) --- section = \(indexPath.section), row = \(indexPath.row)")

        let currentArticle = articleList[indexPath.row]
        cell.articleTitleLabel = currentArticle.title
        cell.articleDescLabel = currentArticle.content
        
        if currentArticle.image_url == "" {
            
            return cell
        }
            
        else
        {
            
            if let img = cache.object(forKey: currentArticle.image_url as AnyObject) {
                
                cell.articleImgView = (img as! UIImage)
            }
            else {
                DispatchQueue.global().async {
                    let downloadedimg = NSData(contentsOf: URL(string:(currentArticle.image_url)!)!)
                    DispatchQueue.main.async {
                        cell.articleImgView = UIImage(data: downloadedimg! as Data)
                        self.cache.setObject(UIImage(data: downloadedimg! as Data)!, forKey: currentArticle.title as AnyObject)
                    }
                }
                
            }
        }
        
        cell.layoutSubviews()
        return cell
    }
    
    func refreshTable()
    {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            return
        }
    }
    
    @objc func reloadData()
    {
        DispatchQueue.main.async {
            self.startfunc()
            self.refreshControl?.endRefreshing()
            return
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 150
    }
    
}

