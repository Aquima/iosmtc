//
//  SecondViewController.swift
//  MTCSwift
//
//  Created by NARA on 4/5/18.
//  Copyright © 2018 MTC. All rights reserved.
//

import UIKit
protocol SecondViewControllerDelegate {
    func completedChangePhoto(image:UIImage)
}
class SecondViewController: UIViewController {

    @IBOutlet weak var imgPhoto: UIImageView!
    //patron delegado
    var delegate:SecondViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changePhoto(_ sender: UIButton) {
        imgPhoto.image = #imageLiteral(resourceName: "iconCamera")
     //   self.delegate?.completedChangePhoto(image: imgPhoto.image!)
        // Post notification:
        let notificationName = NSNotification.Name(rawValue: "cambioPhoto")
        NotificationCenter.default.post(name:notificationName,
                                        object: imgPhoto.image,
                                        userInfo: nil)
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
