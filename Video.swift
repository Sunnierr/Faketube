//
//  Video.swift
//  Faketube
//
//  Created by Test Test on 5/14/17.
//  Copyright © 2017 Sunnier. All rights reserved.
//

import UIKit

class Video: NSObject {

    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?

    var channel: Channel?

}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
