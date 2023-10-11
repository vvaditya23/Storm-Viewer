//
//  ViewController.swift
//  Storm Viewer
//
//  Created by ヴィヤヴャハレ・アディティア on 11/10/23.
//

import UIKit

class ViewController: UIViewController {

    let VC = UIViewController()
    let tableView = UITableView()
    
    var pictures: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationController = UINavigationController(rootViewController: VC)
        
        setUpTableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Picture")
        self.view.addSubview(tableView)
        
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setUpTableView() {
        // Get main screen bounds
        let screenSize: CGRect = UIScreen.main.bounds
                
                let screenWidth = screenSize.width
                let screenHeight = screenSize.height
         
                tableView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
                tableView.dataSource = self
                tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
}
