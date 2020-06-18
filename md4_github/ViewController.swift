//
//  ViewController.swift
//  md4_github
//
//  Created by viva brolite on 14/06/2020.
//  Copyright © 2020 vivabrolite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var githubUserName: UITextField!
    @IBOutlet weak var bioLabel: UITextView!
    
    var repoFiles = [GithubRepoFile]()
    
    var repoFilesJPG = [GithubRepoFile]()
    var repoFilesMP3 = [GithubRepoFile]()
    var repoFilesTXT = [GithubRepoFile]()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData(userName: "ioslekcijas")
    }
    
    
    func downloadFromURL(downloadURL: String){
        
        guard let url = URL(string: downloadURL) else {return}
        let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
        
    }
    
    func fetchData(userName: String){
        
        let urlString = URL(string: "https://api.github.com/users/\(userName)")
        var urlRequest = URLRequest(url: urlString!)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: urlRequest){(data, response, error) in
            
            if let data = data{
                let decoder = JSONDecoder()
                if let githubUser = try? decoder.decode(GithubUser.self , from: data){
                    
                    DispatchQueue.main.async{
                        self.updateUserInterface(with: githubUser)
                    }
                    
                } else {
                    print(error?.localizedDescription ?? "")
                }
            
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    func updateUserInterface(with user: GithubUser){
        self.nameLabel.text = user.name
        self.companyLabel.text = user.company
        self.bioLabel.text = user.bio
        
        self.imageView.downloaded(from: user.avatarURL ?? "https://dummyimage.com/600x400/000/fff&text=Nav+attēla")
    }
    
    
    @IBAction func searchTapped(_ sender: Any) {
            
        let name = githubUserName.text ?? "ioslekcijas"
        fetchData(userName: name)
            
    }
    


}

extension ViewController: URLSessionDownloadDelegate{
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        //print("File location: \(location)")
    }
    
}

