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
        
        //add the share button on the right side of nav controller
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 1) else {
            print("Error in image")
            return
        }
        
        //the sheet that pops up when user clicks on share and allows user to select optios to share
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        //below line of code is essential for it to show up on iPad
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}

extension DetailViewController {
   
}
