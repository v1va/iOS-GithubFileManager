//
//  DocumentViewController.swift
//  md4_github
//
//  Created by viva brolite on 17/06/2020.
//  Copyright © 2020 vivabrolite. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController, UITableViewDataSource{
    
    let dataLoader = DataLoader().repoDocuments
    
    var repoDocuments = [GithubRepoFile]()
    @IBOutlet weak var tableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let file = repoDocuments[indexPath.section]
//        cell.textLabel?.text = file.name
        
        
        return cell
    }
    
    
    override func viewDidLoad() {
        
        
    }
    
    
}
