//
//  GOTEpisode.swift
//  AC3.2-GameOfThrones
//
//  Created by Tong Lin on 10/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation
/*
{
    "_links": {
        "self": {
            "href": "http://api.tvmaze.com/episodes/4952"
        }
    },
    "airdate": "2011-04-17",
    "airstamp": "2011-04-17T21:00:00-04:00",
    "airtime": "21:00",
    "id": 4952,
    "image": {
        "medium": "http://tvmazecdn.com/uploads/images/medium_landscape/1/2668.jpg",
        "original": "http://tvmazecdn.com/uploads/images/original_untouched/1/2668.jpg"
    },
    "name": "Winter is Coming",
    "number": 1,
    "runtime": 60,
    "season": 1,
    "summary": "<p>Lord Eddard Stark, ruler of the North, is summoned to court by his old friend, King Robert Baratheon, to serve as the King's Hand. Eddard reluctantly agrees after learning of a possible threat to the King's life. Eddard's bastard son Jon Snow must make a painful decision about his own future, while in the distant east Viserys Targaryen plots to reclaim his father's throne, usurped by Robert, by selling his sister in marriage.</p>",
    "url": "http://www.tvmaze.com/episodes/4952/game-of-thrones-1x01-winter-is-coming"
},*/

class GOTEpisode {
    let name: String
    let number: Int
    let airdate: String
    
    let airstamp: String
    let airtime: String
    let id: Int
    
    let runtime: Int
    let summary: String
    let season: Int
    
    let url: String
    let mediumImage: String
    let originalImage: String
    
    init(name: String, number: Int, airdate: String, airstamp: String, airtime: String, id: Int, runtime: Int, summary: String, season: Int, url: String, mImage: String, oImage: String) {
        self.name = name
        self.number = number
        self.airdate = airdate
        self.airstamp = airstamp
        self.airtime = airtime
        self.id = id
        self.runtime = runtime
        self.summary = summary
        self.season = season
        self.url = url
        self.mediumImage = mImage
        self.originalImage = oImage
    }
    
    convenience init?(withDict dict: [String:Any]) {
        if let name = dict["name"] as? String,
            let number = dict["number"] as? Int,
            let airdate = dict["airdate"] as? String,
            let airstamp = dict["airstamp"] as? String,
            let airtime = dict["airtime"] as? String,
            let id = dict["id"] as? Int,
            let runtime = dict["runtime"] as? Int,
            let summary = dict["summary"] as? String,
            let season = dict["season"] as? Int,
            let url = dict["url"] as? String,
            let images = dict["image"] as? [String: Any],
            let mImage = images["medium"] as? String,
            let oImage = images["original"] as? String{
            self.init(name: name, number: number, airdate: airdate, airstamp: airstamp, airtime: airtime, id: id, runtime: runtime, summary: summary, season: season, url: url, mImage: mImage, oImage: oImage)
        }
        else {
            return nil
        }
    }
}
