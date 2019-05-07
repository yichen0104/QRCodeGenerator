//: Playground - noun: a place where people can play
import Foundation
import UIKit
import PlaygroundSupport

class ViewController: UIViewController {
    var qrcodeImage = CIImage()
    var textField = UITextField(frame: CGRect(x:50,y:100,width:300,height:40))
    var imgQRCode = UIImageView(frame: CGRect(x:150,y:150,width:120,height:120))
    var btnAction = UIButton(frame: CGRect(x:150,y:300,width:100,height:20))
    /*
    @IBOutlet weak var textField: UITextField!
     @IBOutlet weak var imgQRCode: UIImageView!
     @IBOutlet weak var btnAction: UIButton!
     */
    
    
    
    func performButtonAction(button: UIButton) {
        //if qrcodeImage == nil {
            
            if textField.text == "" {
                return
            }
            
            let data = textField.text?.data(using: String.Encoding.isoLatin1, allowLossyConversion:false)
            
            let filter = CIFilter(name: "CIQRCodeGenerator")
            
            filter?.setValue(data, forKey: "inputMessage")
            
            qrcodeImage = (filter?.outputImage)!
            
            imgQRCode.image = UIImage(ciImage: qrcodeImage)
            
            textField.resignFirstResponder()
            
        //}
    }
    //Input text or URL after textview.text and generate QR Code!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Input in text field and generate"
        view.backgroundColor = UIColor.white
        btnAction.backgroundColor = UIColor.black
        btnAction.setTitle("Generate", for: .normal)
        //view.addSubview(btnAction)
        view.addSubview(imgQRCode)
        //view.addSubview(textField)
        var a = Int(self.view.bounds.size.width)
        textField.text = ""
        textField.backgroundColor = UIColor.gray
        btnAction.addTarget(self, action: #selector(performButtonAction(button:)), for: .touchUpInside)
        view.addSubview(textField)
        view.addSubview(btnAction)
        performButtonAction(button: btnAction)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
PlaygroundPage.current.liveView = UINavigationController(rootViewController: ViewController())


/*
let filePath = Bundle.main.path(forResource: "View", ofType: "xib")
//var bundle = Bundle.main.loadNibNamed("View", owner: nil, options: nil)
let storyboard = UIStoryboard(name: "Main", bundle: filePath )
let controller = storyboard.instantiateInitialViewController()
 PlaygroundPage.current.liveView = UINavigationController(rootViewController: controller!)
 */
