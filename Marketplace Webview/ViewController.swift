//
//  ViewController.swift
//  Marketplace Webview
//
//  Created by Angelo Vescio on 7/5/23.
//

import UIKit
import Marketplace

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
        
        apikeyText.text = "AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE"
        localeText.text = "es-rMX"
        sessionIdText.text = "d/fvIRn........jL1DWG"

        // Do any additional setup after loading the view.
    }

    @IBAction func goWebView(_ sender: Any) {
        
        let vc = MarketplaceViewController()
        vc.sessionId = sessionIdText.text ?? "Valid Session ID"
        vc.apikey  = apikeyText.text ?? "Valid API Key"
        vc.locale = localeText.text ?? "Valid Locale such as es-rMX or en-rUS"
        vc.urlBase = "https://creditos-web.prosperas.com"
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

