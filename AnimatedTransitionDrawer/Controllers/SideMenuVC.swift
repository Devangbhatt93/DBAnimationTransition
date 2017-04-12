//
//  SideMenuVC.swift
//  AnimatedTransitionDrawer
//
//  Created by devang.bhatt on 12/04/17.
//  Copyright © 2017 devang.bhatt. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController {

    @IBOutlet var tblSideMenu: UITableView!
    @IBOutlet var imgBg: UIImageView!

    var arrValue = [SideMenu]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tblSideMenu.backgroundColor = UIColor.clear
        imgBg.image = UIImage(named: "img_sea")
        
        let menu1 = SideMenu(title: "Chat", icon: "img_chat")
        let menu2 = SideMenu(title: "Filter", icon: "img_filter")
        let menu3 = SideMenu(title: "Home", icon: "img_home")
        let menu4 = SideMenu(title: "Info", icon: "img_info")
        
        arrValue = [menu1 , menu2 , menu3 ,menu4]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SideMenuVC : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sideViewCell = tableView.dequeueReusableCell(withIdentifier: "sideMenuCell", for: indexPath) as! SideViewCell
        
        let menuItems = arrValue[indexPath.row]
        
        sideViewCell.lblTitle.text = menuItems.title
        sideViewCell.imgIcon.image = UIImage(named: menuItems.icon)
        
        return sideViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
    }
    
//    override var preferredStatusBarStyle : UIStatusBarStyle {
//        return .default
//    }
}
