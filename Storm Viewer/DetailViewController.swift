//
//  DetailViewController.swift
//  Storm Viewer
//
//  Created by ヴィヤヴャハレ・アディティア on 12/10/23.
//

import UIKit

class DetailViewController: UIViewController {

    let imageView = UIImageView()
    let commonSuperview = UIView()
    
    var selectedImage: String?
    var array = [String]()
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "\(selectedIndex) of \(array.count)"
        navigationItem.largeTitleDisplayMode = .never
        
        commonSuperview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(commonSuperview)
        commonSuperview.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        commonSuperview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        // Add the imageView to the common parent view
        commonSuperview.addSubview(imageView)

        // Now, add constraints to the common parent view
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: commonSuperview.leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: commonSuperview.trailingAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: commonSuperview.topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: commonSuperview.bottomAnchor, constant: 0).isActive = true

        imageView.contentMode = .scaleAspectFit
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
