//
//  ContainerView2.swift
//  viewController_containerView
//
//  Created by Luthfi Fathur Rahman on 5/31/17.
//  Copyright © 2017 Luthfi Fathur Rahman. All rights reserved.
//

import UIKit

class ContainerView2: UIViewController {
    
    @IBOutlet weak var scrollView2: UIScrollView!
    
    let posterFilm = ["batman", "belko_", "hangover", "harryPotter", "nacho_libre", "pirates", "spectre", "starTrek", "thor", "xmen"]
    var imageViews = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView2.backgroundColor = UIColor.blue
        
        self.view.addSubview(scrollView2)
        
        let ukuranXgambar = 19
        let ukuranYgambar = 19
        let imageWidth = 93
        let imageHeight = 128
        
        var curr_imageView = UIImageView()
        for i in 0 ..< posterFilm.count {
            if imageViews.isEmpty {
                curr_imageView = UIImageView.init(frame: CGRect(x: ukuranXgambar, y:ukuranYgambar, width: imageWidth, height: imageHeight))
            } else {
                curr_imageView = UIImageView.init(frame: CGRect(x: Int(imageViews[i-1].frame.origin.x)+Int(imageViews[i-1].frame.size.width), y:ukuranYgambar, width: imageWidth, height: imageHeight))
            }
            
            curr_imageView.image = UIImage(named: posterFilm[i])
            curr_imageView.contentMode = .scaleAspectFit
            self.scrollView2.addSubview(curr_imageView)
            imageViews.append(curr_imageView)
        }
        
        self.scrollView2.contentSize = CGSize(width: imageViews[imageViews.count-1].frame.size.width+imageViews[imageViews.count-1].frame.origin.x+CGFloat(ukuranXgambar), height: self.scrollView2.frame.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
