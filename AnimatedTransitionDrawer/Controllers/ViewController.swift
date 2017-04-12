//
//  ViewController.swift
//  AnimatedTransitionDrawer
//
//  Created by devang.bhatt on 12/04/17.
//  Copyright © 2017 devang.bhatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tblMain: UITableView!
    var transitionOperation = TransitionOperation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tblMain.reloadData()
    }
    
    func initNavigationBar() {
        tblMain.estimatedRowHeight = 100.0
        tblMain.rowHeight = UITableViewAutomaticDimension
        
        let leftItemBarButton = UIBarButtonItem(image: UIImage(named: "img_menu"), style: .plain, target: self, action: #selector(leftBarButtonTapped))
        self.navigationItem.leftBarButtonItem = leftItemBarButton
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toViewController = segue.destination as UIViewController
        self.modalPresentationStyle = .custom
        toViewController.transitioningDelegate = self.transitionOperation
    }

    @IBAction func leftBarButtonTapped(_ sender: UIBarButtonItem) {
      performSegue(withIdentifier: "navigateVC", sender: self)
    }
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0 {
//            return 150
//        } else {
//            return 145
//        }
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let descCell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath) as! DescriptionCell
            descCell.lblName.text = "Devang Bhatt"
            descCell.lblDescription.text = "My name is Anthony Gonzalis, mai duniya me akela hu, ghar bhi hai khali, dil bhi hai khali, isme rahegi koi kismat vali...!"
            descCell.imgProfile.image = UIImage(named: "img_menu")
            return descCell
            
        case 1:
            let imgCell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
            imgCell.lblProfileName.text = "Rajan"
            imgCell.imgProfile.image = UIImage(named: "img_menu")
            imgCell.imgView.image = UIImage(named: "img_sea")
            return imgCell
        default:
            return UITableViewCell()
        }
    }
}
