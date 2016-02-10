import UIKit
class Description : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var enrollment: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var collegeURL: UITextField!
    var colleges : [College] = []
    
    var url : String = ""
    var i : UIImage? = nil
    var e : Int = -1
    var l : String = "l"
    var n : String = "n"
    
    override func viewDidLoad()
    {
        imagePicker.delegate = self
        enrollment.text = "\(e)"
        location.text = l
        name.text = n
        image.image = i
        if url != ""
        {
            collegeURL.text = url
        }
    }
    
    @IBAction func done(sender: AnyObject)
    {
        for var i = 0; i < colleges.count; i++
        {
            if colleges[i].name == n
            {
                colleges[i].location = self.location.text!
                colleges[i].numberOfStudents = (Int)(self.enrollment.text!)!
                colleges[i].collegeURL = self.collegeURL.text!
                if self.image.image != nil
                {
                    colleges[i].image = self.image.image!
                }
            }
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cameraButtonTapped(sender: AnyObject)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func photoButtonTapped(sender: AnyObject)
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[String : AnyObject])
    {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.image.image = selectedImage
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "webView"
        {
            let destinationVC = segue.destinationViewController as! WebView
            if collegeURL.text! != ""
            {
                destinationVC.URL = self.collegeURL.text!
            }
        }
    }
}