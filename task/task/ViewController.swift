//
//  ViewController.swift
//  task
//
//  Created by Apple on 26/09/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var jsonresult = [String :Any]()
    var data = [[String :Any]]()

    var sender = [String]()
    
    @IBOutlet weak var listTableVw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            self.listTableVw.delegate = self
            self.listTableVw.dataSource = self
            self.get()
    }
    
    func get()  {
        let urlstrng = URL(string: "https://reqres.in/api/users")
        var urlreq = URLRequest(url: urlstrng!)
        urlreq.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: urlreq) { (data, response, error) in
            if let err = error
            {
                print(err.localizedDescription)
            }
            if let resp = response
            {
                print(resp)
            }
            do {
                self.jsonresult = try JSONSerialization.jsonObject(with: data!, options: [])  as! [String:Any]
                print(self.jsonresult)
                self.data = self.jsonresult["data"] as! [[String:Any]]

            }
            catch let err as NSError {
                print(err)
            }
            DispatchQueue.main.async {
                self.listTableVw.reloadData()
            }
        }
        task.resume()

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "userTableViewCell") as! userTableViewCell
        cell.userNameLbl.text = "\(self.data[indexPath.row]["first_name"]!)"
        
        cell.userIdLbl.text = "\(self.data[indexPath.row]["id"]!)"
        cell.userEmailLbl.text = "\(self.data[indexPath.row]["email"]!)"
        let imgstrng = "\(self.data[indexPath.row]["avatar"] ?? "")"
        let imgurl = URL(string: imgstrng)
        let imgdata = NSData(contentsOf: imgurl!)
        if imgdata != nil {
            cell.userImgVw.image = UIImage(data: imgdata! as Data )
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pushAct = storyboard?.instantiateViewController(identifier: "nextViewController") as! nextViewController
        self.sender = ["\(self.data[indexPath.row]["first_name"]!)","\(self.data[indexPath.row]["id"]!)","\(self.data[indexPath.row]["email"]!)"]
        
        
            pushAct.receiver = self.sender

        
        self.navigationController?.pushViewController(pushAct, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

