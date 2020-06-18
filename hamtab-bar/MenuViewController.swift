//
//  MenuViewController.swift
//  hamtab-bar
//
//  Created by Vraj Patel on 13/06/20.
//  Copyright © 2020 Vraj Patel. All rights reserved.
//

import UIKit

enum MenuType: Int{
    
    case Home
    case Camera
    case Settings
}

class MenuViewController: UITableViewController{
    
    var didTapMenuType: ((MenuType) -> Void)?
    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view, typically from a nib.
       }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard  let menuType = MenuType(rawValue: indexPath.row) else {  return }

        dismiss(animated: true) { [weak self]  in
            print("Dismissing...\(menuType)")
            self?.didTapMenuType?(menuType)
        }
    }
}
