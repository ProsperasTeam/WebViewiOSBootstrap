//
//  ViewController.swift
//  Marketplace Webview
//
//  Created by Angelo Vescio on 7/5/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Button1: UIButton!
    var apikey = ""
    var sessionId = ""
    var locale = ""
    
    
    @IBOutlet weak var apikeyText: UITextField!
    
    @IBOutlet weak var localeText: UITextField!
    @IBOutlet weak var sessionIdText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        sessionIdText.text = "25b99cb9-ba99-4bc6-bf51-9c718b1eb23e"
        localeText.text = "en-rUS"
        apikeyText.text = "7608A3A2-4531-443C-8CEB-5A1DD6B42EE0"

        // Do any additional setup after loading the view.
    }

    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("mi segue identifier \(segue.identifier)")
        if (segue.identifier == "WebSegue") {
            let view2 = segue.destination as! ViewController2
            //_ = sender as! [Int: Any?]
            print("el apikey que voy a enviar \(apikeyText.text)")
            print("el sessionId que voy a enviar \(sessionIdText.text)")
            print("el locale que voy a enviar \(localeText.text)")
            view2.apikey = apikeyText.text ?? ""
            view2.sessionId = sessionIdText.text ?? ""
            view2.locale = localeText.text ?? ""
        }
    }

    @IBAction func goWebView(_ sender: Any) {
        self.performSegue(withIdentifier: "WebSegue", sender: nil)
    }
}

