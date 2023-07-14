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
        
        apikeyText.text = "f0627e97-48fb-456b-ba05-c20ce8c56105"
        localeText.text = "es-rMX"
        sessionIdText.text = "d/fvIRnSFf2gQslGnCVm/pz7u8K5JTkEFY5w7KJ1rSawvF0tFj68wuL+Zuy2DrEkr8I/dqUj27iW0fg4RyMaU+jsqimIAsTVZnJjjYWpymAwyFRXa7rZyk8nz0jL1DWG"

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

