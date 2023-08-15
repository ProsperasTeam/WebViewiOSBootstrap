import UIKit
import WebKit
import Marketplace

class SDKView: UIView {
    // MARK: - Properties
    let apiKeyLabel = "apiKey".localized()
    let sessionIdLabel = "sessionId".localized()
    let localeLabel = "locale".localized()
    var mkconfig =  MarketplaceConfiguration()
    let stackView = UIStackView()
    
    //MARK: - Marketplace Configuration
    struct MarketplaceConfiguration {
        var apiKey: String
        var sessionId: String
        var locale: String
        var urlBase: String
        
        init(apiKey: String = "", sessionId: String = "", locale: String = "", urlBase: String = "") {
            self.apiKey = apiKey
            self.sessionId = sessionId
            self.locale = locale
            self.urlBase = urlBase
        }
    }
    
    //MARK: - Initializers
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .white
        setupDefaultConfig()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    func setupUI() {
        stackView.axis = .vertical
        stackView.spacing = 20
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        generateLabelComponents(labelKey: apiKeyLabel, textFieldValue: mkconfig.apiKey, tag: 1)
        generateLabelComponents(labelKey: sessionIdLabel, textFieldValue: mkconfig.sessionId, tag: 2)
        generateLabelComponents(labelKey: localeLabel, textFieldValue: mkconfig.locale, tag: 3)
        
        createStartSDKButton()
    }
    
    //MARK: - Functions
    private func generateLabelComponents (labelKey: String, textFieldValue: String, tag: Int) {
        let label = UILabel()
        
        label.text = labelKey
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        stackView.addArrangedSubview(label)
        
        let textField = UITextField()
        textField.placeholder = labelKey
        textField.text = textFieldValue
        textField.borderStyle = .roundedRect
        textField.tag = tag
        stackView.addArrangedSubview(textField)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    // A method that creates the Start SDK button
    private func createStartSDKButton() {
        let button = UIButton(type: .system)
        button.setTitle("startSDK".localized(), for: .normal)
        button.addTarget(self, action: #selector(openWebView), for: .touchUpInside)
        stackView.addArrangedSubview(button)
    }
    
    // Sets up the default configuration for the marketplace.
    private func setupDefaultConfig() {
        mkconfig = MarketplaceConfiguration(
            apiKey: "f0627e97-48fb-456b-ba05-c20ce8c56105",
            sessionId: "d/fvIRnSFf2gQslGnCVm/pz7u8K5JTkEFY5w7KJ1rSawvF0tFj68wuL+Zuy2DrEkr8I/dqUj27iW0fg4RyMaU+jsqimIAsTVZnJjjYWpymAwyFRXa7rZyk8nz0jL1DWG",
            locale: "es-rMX",
            urlBase: "https://creditos-web.prosperas.com"
        )
    }
    
    //MARK: - Actions
    
    // Opens the marketplace web view with the configured parameters.
    @objc func openWebView() {
        if !validateFields() {
            return
        }
        
        let mpvc = MarketplaceViewController()
        
        updateField(tag: 1, field: &mkconfig.apiKey)
        updateField(tag: 2, field: &mkconfig.sessionId)
        updateField(tag: 3, field: &mkconfig.locale)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let viewController = windowScene.windows.first?.rootViewController {
            mpvc.apikey = mkconfig.apiKey != "" ? mkconfig.apiKey : "Provide a valid apiKey";
            mpvc.sessionId = mkconfig.sessionId != "" ? mkconfig.sessionId : "Provide a valid Session ID";
            mpvc.locale = mkconfig.locale != ""  ? mkconfig.locale : "Provide a valid locale such as es-rMX or en-rUS";
            mpvc.urlBase = mkconfig.urlBase != "" ? mkconfig.urlBase : "Provide a valid URL String"
            mpvc.setNativeButtonColor(rgb: 0xBE5300)
            mpvc.modalPresentationStyle = .fullScreen
            viewController.present(mpvc, animated: true)
        }
    }
    
    //Check if the required fields are valid and not empty
    private func validateFields() -> Bool {
        if mkconfig.apiKey.isEmpty || mkconfig.sessionId.isEmpty || mkconfig.locale.isEmpty || mkconfig.urlBase.isEmpty {
            displayErrorAlert(message: "Please fill in all required fields.")
            return false
        }
        return true
    }
    
    // A function that checks if the textfield value has changed and updating the field if there is an user input
    private func updateField(tag: Int, field: inout String) {
        if let textField = viewWithTag(tag) as? UITextField {
            let newValue = textField.text ?? ""
            if newValue != field {
                field = newValue
            }
        }
    }
    
    // A custom method that displays an error as a popup
    private func displayErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let viewController = windowScene.windows.first?.rootViewController {
            
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
}


