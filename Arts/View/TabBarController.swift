//
//  TabBarController.swift
//  Arts
//
//  Created by nurboldy on 12/23/18.
//  Copyright © 2018 nurboldy. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //cyan color
        //tabBar.barTintColor = UIColor(red: 0/255, green: 255/255, blue: 255/255, alpha: 1)
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = UIColor.black
        setupViews()
    }
    
    func setupViews() {
        let profileController = UINavigationController(rootViewController: ProfileController())
        profileController.tabBarItem.title = "Profile"
        profileController.tabBarItem.image = UIImage(named: "Profile-25")?.withRenderingMode(.alwaysOriginal)
        
        let browseController = UINavigationController(rootViewController: BrowseController())
        browseController.tabBarItem.title = "Browse"
        browseController.tabBarItem.image = UIImage(named: "Browse")?.withRenderingMode(.alwaysOriginal)
        
        viewControllers = [profileController, browseController]
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
