//
//  ViewController.swift
//  Storm Viewer
//
//  Created by ヴィヤヴャハレ・アディティア on 11/10/23.
//

import UIKit

class ViewController: UIViewController {

    var pictures: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.bundlePath
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            //picture loaded
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
//        print(pictures)
    }


}

