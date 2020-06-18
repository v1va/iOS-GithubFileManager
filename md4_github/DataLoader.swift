//
//  DataLoader.swift
//  md4_github
//
//  Created by viva brolite on 17/06/2020.
//  Copyright © 2020 vivabrolite. All rights reserved.
//

import Foundation

class DataLoader{
    
    var repoFiles = [GithubRepoFile]()
    var repoPhotos = [GithubRepoFile]()
    var repoMedia = [GithubRepoFile]()
    var repoDocuments = [GithubRepoFile]()
    
    init(){

        fetchRepoData(){result in

            switch result {
            case .failure(let error):
                print(error)

            case .success(let data):
                for file in data{
                    
                    let fileExtension = file.name!.suffix(3)
                     
                    if fileExtension == "jpg"{
                        self.repoPhotos.append(file)
                    }
                     
                    if fileExtension == "mp4"{
                        self.repoMedia.append(file)
                    }
                     
                    if fileExtension == "pdf"{
                        self.repoDocuments.append(file)
                    }
                    
                    
                }
            }

        }

    }

    func fetchRepoData(completionHandler: @escaping (Result<[GithubRepoFile], Error>) -> Void){
        
        let urlString = URL(string: "https://api.github.com/repos/ioslekcijas/faili/contents")
        var urlRequest = URLRequest(url: urlString!)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: urlRequest){(data, response, error) in
            
            if let data = data{
                let decoder = JSONDecoder()
                if let githubUserRepo = try? decoder.decode([GithubRepoFile].self , from: data){
                    
                    self.repoFiles = githubUserRepo
                    completionHandler(.success(self.repoFiles))
                    
                } else {
                    print(error?.localizedDescription ?? "")
                }
            
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
}
