//
//  ViewController.swift
//  Demo
//
//  Created by LunarEclipse on 2016/11/25.
//  Copyright © 2016 Sakura. All rights reserved.
//

import UIKit
import Sakura

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var separator: UISeparator!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("氷菓".pinyin)
        textField.placeholderColor = UIColor.red
        separator.patternString = "20,20"
//        separator.pattern = [10, 10, 123]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(3000)) {
            self.label.text = "ddd"
            self.greenLabel.text = "xxx"
            self.greenLabel.setNeedsDisplay()
            self.view.setNeedsDisplay()
        }
        
        button.textLayout = .bottom
        button.textLayoutSpacing = 20
//        button.sizeToFit()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let controller = UIWebViewController(url: "http://cs.bukamanhua.com:8000/event/movie_ticket.php")
        controller.redirector = ["" : self.handler]
        self.present(controller, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func handler(url: URL, parameters:[String:String]?) {
        let redirectURL = URLComponents(string: url.absoluteString)?.queryItems?.filter{ $0.name == "redirect_url" }.first?.value
        debugPrint("HHHH: \(redirectURL)")
    }
    
}
