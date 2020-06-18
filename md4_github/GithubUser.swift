//
//  GithubUser.swift
//  md4_github
//
//  Created by viva brolite on 15/06/2020.
//  Copyright © 2020 vivabrolite. All rights reserved.
//

import Foundation


struct GithubUser: Codable {
    let avatarURL: String?
    let name, company, bio: String?
    
    enum CodingKeys: String, CodingKey{
        case avatarURL = "avatar_url"
        case name, company, bio
    }
}
