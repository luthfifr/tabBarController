//
//  ViewController.swift
//  viewController_containerView
//
//  Created by Luthfi Fathur Rahman on 5/31/17.
//  Copyright © 2017 Luthfi Fathur Rahman. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var container1: UIView!
    @IBOutlet weak var container2: UIView!
    @IBOutlet weak var container3: UIView!
    @IBOutlet weak var container4: UIView!
    
    /*
     contoh inisialisasi childviewcontroller secara pemrograman
     lazy var containerView1: ContainerView1 = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "Container1") as! ContainerView1
        
        self.addVCasChildVC(child: viewController)
        
        return viewController
    }()
    
    lazy var containerView2: ContainerView2 = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "Container2") as! ContainerView2
        
        self.addVCasChildVC(child: viewController)
        
        return viewController
    }()
    
    lazy var containerView3: ContainerView3 = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "Container1") as! ContainerView3
        
        self.addVCasChildVC(child: viewController)
        
        return viewController
    }()
    
    lazy var containerView4: ContainerView4 = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "Container1") as! ContainerView4
        
        self.addVCasChildVC(child: viewController)
        
        return viewController
    }()
 */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray
        scrollView.frame = CGRect(x:0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height+container4.frame.size.height+(container4.frame.origin.y - container3.frame.origin.y))
        
        //cek childviewcontroller
        print(childViewControllers.count)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*private func addVCasChildVC(child: UIViewController, containers: UIView){
        if childViewControllers.contains(child) {
            child.view.frame = containers.bounds
        } else {
            child.willMove(toParentViewController: self)
            addChildViewController(child)
            view.addSubview(child.view)
            child.view.frame = containers.bounds
            //child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            child.didMove(toParentViewController: self)
        }
    }*/

}
