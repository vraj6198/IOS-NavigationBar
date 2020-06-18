//
//  ViewController.swift
//  hamtab-bar
//
//  Created by Vraj Patel on 13/06/20.
//  Copyright © 2020 Vraj Patel. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {


    let transition = SlideInTransition()
    var topView = UIView().self
    
    override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view, typically from a nib.
     }
    
    @IBAction func didTipMenu(_ sender: UIBarButtonItem) {
        
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "menuViewController") as?
            MenuViewController else{ return }
        
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }

    func transitionToNew(_ menuType: MenuType) {
            let title = String(describing: menuType).capitalized
            self.title = title

        topView.removeFromSuperview()
            switch menuType {
            case .Camera:
                let view = UIView()
                view.backgroundColor = .orange
                view.frame = self.view.bounds
                self.view.addSubview(view)
                self.topView = view
            case .Settings:
                let view = UIView()
                view.backgroundColor = .purple
                view.frame = self.view.bounds
                self.view.addSubview(view)
                self.topView = view
            default:
                break
        }
    }
}

extension HomeViewController: UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
       
        transition.isPresenting = false
        return transition
    }
}
