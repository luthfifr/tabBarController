//
//  ContainerView4.swift
//  viewController_containerView
//
//  Created by Luthfi Fathur Rahman on 5/31/17.
//  Copyright © 2017 Luthfi Fathur Rahman. All rights reserved.
//

import UIKit

class ContainerView4: UIViewController {
    
    @IBOutlet weak var scrollView4: UIScrollView!
    
    var gambar1 = UIImageView()
    var gambar2 = UIImageView()
    var gambar3 = UIImageView()
    var gambar4 = UIImageView()
    var gambar5 = UIImageView()
    var gambar6 = UIImageView()
    var gambar7 = UIImageView()
    var gambar8 = UIImageView()
    var gambar9 = UIImageView()
    var gambar10 = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView4.backgroundColor = UIColor.blue
        
        self.view.addSubview(scrollView4)
        
        let ukuranXgambar = 19
        let ukuranYgambar = 19
        gambar1 = UIImageView.init(frame: CGRect(x: ukuranXgambar, y:ukuranYgambar, width: 93, height: 128))
        gambar2 = UIImageView.init(frame: CGRect(x: Int(gambar1.frame.origin.x)+Int(gambar1.frame.size.width), y:ukuranYgambar, width: 93, height: 128))
        gambar3 = UIImageView.init(frame: CGRect(x: Int(gambar2.frame.origin.x)+Int(gambar2.frame.size.width), y:ukuranYgambar, width: 93, height: 128))
        gambar4 = UIImageView.init(frame: CGRect(x: Int(gambar3.frame.origin.x)+Int(gambar3.frame.size.width), y:ukuranYgambar, width: 93, height: 128))
        gambar5 = UIImageView.init(frame: CGRect(x: Int(gambar4.frame.origin.x)+Int(gambar4.frame.size.width), y:ukuranYgambar, width: 93, height: 128))
        gambar6 = UIImageView.init(frame: CGRect(x: Int(gambar5.frame.origin.x)+Int(gambar5.frame.size.width), y:ukuranYgambar, width: 93, height: 128))
        gambar7 = UIImageView.init(frame: CGRect(x: Int(gambar6.frame.origin.x)+Int(gambar6.frame.size.width), y:ukuranYgambar, width: 93, height: 128))
        gambar8 = UIImageView.init(frame: CGRect(x: Int(gambar7.frame.origin.x)+Int(gambar7.frame.size.width), y:ukuranYgambar, width: 93, height: 128))
        gambar9 = UIImageView.init(frame: CGRect(x: Int(gambar8.frame.origin.x)+Int(gambar8.frame.size.width), y:ukuranYgambar, width: 93, height: 128))
        gambar10 = UIImageView.init(frame: CGRect(x: Int(gambar9.frame.origin.x)+Int(gambar9.frame.size.width), y:ukuranYgambar, width: 93, height: 128))
        
        gambar1.image = UIImage(named: "batman")
        gambar1.contentMode = .scaleAspectFit
        gambar2.image = UIImage(named: "belko_")
        gambar2.contentMode = .scaleAspectFit
        gambar3.image = UIImage(named: "hangover")
        gambar3.contentMode = .scaleAspectFit
        gambar4.image = UIImage(named: "harryPotter")
        gambar4.contentMode = .scaleAspectFit
        gambar5.image = UIImage(named: "nacho_libre")
        gambar5.contentMode = .scaleAspectFit
        gambar6.image = UIImage(named: "pirates")
        gambar6.contentMode = .scaleAspectFit
        gambar7.image = UIImage(named: "spectre")
        gambar7.contentMode = .scaleAspectFit
        gambar8.image = UIImage(named: "starTrek")
        gambar8.contentMode = .scaleAspectFit
        gambar9.image = UIImage(named: "thor")
        gambar9.contentMode = .scaleAspectFit
        gambar10.image = UIImage(named: "xmen")
        gambar10.contentMode = .scaleAspectFit
        
        self.scrollView4.addSubview(gambar1)
        self.scrollView4.addSubview(gambar2)
        self.scrollView4.addSubview(gambar3)
        self.scrollView4.addSubview(gambar4)
        self.scrollView4.addSubview(gambar5)
        self.scrollView4.addSubview(gambar6)
        self.scrollView4.addSubview(gambar7)
        self.scrollView4.addSubview(gambar8)
        self.scrollView4.addSubview(gambar9)
        self.scrollView4.addSubview(gambar10)
        
        self.scrollView4.contentSize = CGSize(width: gambar10.frame.size.width+gambar10.frame.origin.x+CGFloat(ukuranXgambar), height: self.scrollView4.frame.size.height)
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
