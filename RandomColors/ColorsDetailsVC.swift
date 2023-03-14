
import UIKit

class ColorsDetailsVC: UIViewController {
    
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? .blue
    }

}
