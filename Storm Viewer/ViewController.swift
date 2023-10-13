//
//  ViewController.swift
//  Storm Viewer
//
//  Created by ヴィヤヴャハレ・アディティア on 11/10/23.
//

import UIKit

class ViewController: UIViewController {

    //used to add to navigation controller
    let VC = UIViewController()
    
    //declare tableview
    let tableView = UITableView()
    
    //array to store pictures names
    var pictures: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navigationController = UINavigationController(rootViewController: VC)
        
        setUpTableView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Picture")
        self.view.addSubview(tableView)
        
        //file manager
        let fm = FileManager.default
        let path = Bundle.main.bundlePath
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            //picture loaded
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
            pictures.sort()
        }
//        print(pictures)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
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
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.selectedImage = pictures[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
