//
//  GithubRepoFile.swift
//  md4_github
//
//  Created by viva brolite on 17/06/2020.
//  Copyright © 2020 vivabrolite. All rights reserved.
//

import Foundation

struct GithubRepoFile: Codable{
    let downloadURL: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey{
        case downloadURL = "download_url"
        case name 
    }
    
}
