import UIKit
class WebView: UIViewController
{
    var URL = "https://google.com"
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad()
    {
        let newURL = NSURL(string: URL)
        let urlRequest = NSURLRequest(URL: newURL!)
        webView.loadRequest(urlRequest)
    }

    @IBAction func done(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}