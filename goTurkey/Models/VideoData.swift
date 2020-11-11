//
//  VideoData.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 22/09/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import Foundation

struct Video {
    var authorName: String
    var videoFileName: String
    var thumbnailFileName: String
    
    static func fetchVideos() -> [Video] {
        let v1 = Video(authorName: "Andriake", videoFileName: "v1", thumbnailFileName: "v1")
        
        return [v1]
    }
}
