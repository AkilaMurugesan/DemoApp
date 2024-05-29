//
//  DetailViewController.swift
//  DemoApp
//
//  Created by Arun Subbu on 5/29/24.
//


import UIKit

class DetailViewController: UIViewController {

    var id: String = ""
    var titleValue: String = ""
    var bodyValue: String = ""
    
    @IBOutlet weak var lblBody: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var viewBorder: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblId.text = id
        lblTitle.text = titleValue
        lblBody.text = bodyValue
        // Do any additional setup after loading the view.
       
    }
    override func viewWillAppear(_ animated: Bool) {
        viewBorder.layer.cornerRadius = 10
       
    }

    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
