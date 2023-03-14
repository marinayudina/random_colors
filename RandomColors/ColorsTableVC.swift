

import UIKit

class ColorsTableVC: UIViewController{
    
    var colors: [UIColor] = []
    
    enum Colors {
        static let colorCell = "ColorCell"
    }
    
    enum Segues {
        static let toDetail = "ToColorsDetailsVC"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColor()
    }
    
    func addRandomColor() {
        for _ in 0..<50 {
            colors.append(.createRandomColor())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailsVC
        
        destVC.color = sender as? UIColor
    }
}

extension ColorsTableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }//how many rows to show
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Colors.colorCell) else {
            return UITableViewCell()
        }
        cell.backgroundColor = colors[indexPath.row]
        
        return cell
    }//what to show in each cell
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        
        performSegue(withIdentifier: Segues.toDetail, sender: color)
    }
}
