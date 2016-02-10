import UIKit
class College : NSObject
{
    var name : String!
    var numberOfStudents : Int!
    var location : String!
    var image : UIImage!
    var collegeURL : String = ""
    
    init(n : String, nos : Int, l : String) {
        name = n
        numberOfStudents = nos
        location = l
    }
    
    override init()
    {
        name = ""
        numberOfStudents = 0
        location = ""
    }
    
}