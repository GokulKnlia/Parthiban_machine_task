//
//  nextViewController.swift
//  task
//
//  Created by Apple on 26/09/22.
//

import UIKit

class nextViewController: UIViewController {
    @IBOutlet weak var userIdLbl: UILabel!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var userNamelbl: UILabel!
    @IBOutlet weak var userImgVw: UIImageView!
    var receiver = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.userNamelbl.text = "\(receiver[0])"
        self.userEmailLbl.text = "\(receiver[1])"
        self.userIdLbl.text = "\(receiver[2])"
        
        

        
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
