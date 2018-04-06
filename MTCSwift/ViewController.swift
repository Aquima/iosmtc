//
//  ViewController.swift
//  MTCSwift
//
//  Created by NARA on 4/5/18.
//  Copyright © 2018 MTC. All rights reserved.
//

import UIKit

class ViewController: UIViewController,SecondViewControllerDelegate {
    func completedChangePhoto(image:UIImage) {
        self.imgReflect.image = image
    }
    
    @IBOutlet weak var imgReflect: UIImageView!
    
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var imgMario: UIImageView!
    var vcSecond = SecondViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        User.sharedInstance.age = 1
        User.sharedInstance.name = "Juan"
        let btnAdd = UIButton()
        btnAdd.frame = CGRect(x: (self.view.frame.size.width - 100)/2, y: 200, width: 100, height: 40)
        btnAdd.backgroundColor = .red
        btnAdd.addTarget(self, action: #selector(self.addViewController(sender:)), for: .touchUpInside)
        self.lblUserName.text = "Edad \(User.sharedInstance.age) nombre:\(User.sharedInstance.name)"
        self.view.addSubview(btnAdd)
        
        //Patron observer
        
        let notificationName = NSNotification.Name(rawValue: "cambioPhoto")
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(completedChangePhotoListenner),
                                               name: notificationName,
                                               object: nil)
      
    }
    @objc func completedChangePhotoListenner(notification:Notification) {
        
        self.imgReflect.image = notification.object as? UIImage
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addViewController(sender:UIButton){

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vcSecond = storyboard.instantiateViewController(withIdentifier: "vcSecond") as! SecondViewController
        vcSecond.delegate = self
        vcSecond.view.backgroundColor = .orange
        // Alternative way to present the new view controller
        
        self.present(vcSecond, animated: true, completion: nil)
    }
    @IBAction func moveMArio(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations: {
            self.imgMario.frame = CGRect(x: self.imgMario.frame.origin.x + 120, y: self.imgMario.frame.origin.y + 120, width: self.imgMario.frame.size.width, height: self.imgMario.frame.size.height)
        }, completion:{ finished in
            User.sharedInstance.age = 50
            self.lblUserName.text = "Edad \(User.sharedInstance.age) nombre:\(User.sharedInstance.name)"
        })
    }
    
}

