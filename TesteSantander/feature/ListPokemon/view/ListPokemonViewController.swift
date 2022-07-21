import UIKit

class ListPokemonViewController: UIViewController {
    
    weak var navigation:UINavigationController?
    var presenterInterface: ListPokemonPresenterInterface!
    var listPokemon:[Pokemon] = []
    var idSelect:Int = 0
    
    @IBOutlet weak var tableview: UITableView!
    

    //MARK: - init -
    static func storyboardInstance() -> ListPokemonViewController? {
        let storyboard = UIStoryboard(name: String.className(self), bundle: nil)
        return storyboard.instantiateInitialViewController() as? ListPokemonViewController
    }
    
    //MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupViewDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.showLoading()
        self.presenterInterface.loadListPokemon(limit: 1000, offset: 0)
    }
    
    private func setup() {
        ListPokemonWireframe.setUp(vc: self)
        self.dismissKeyboard()
    }
    
    private func setupViewDelegates() {
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        let nib = UINib(nibName: "PokemonTableViewCell", bundle: nil)
        self.tableview.register(nib, forCellReuseIdentifier: "cellPokemon")
        
        self.tableview.tableFooterView = UIView()
        self.tableview.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetailPokemon" {
            let vc: DetailPokemonViewController = segue.destination as! DetailPokemonViewController
            vc.idSelect = self.idSelect
        }
    }
}

extension ListPokemonViewController: ListPokemonPresenterViewInterface {
    
    func fetchListPokemon(list: [Pokemon]) {
        self.hideLoading()
        self.listPokemon = list
        
        self.tableview.reloadData()
    }
    
    func failure(msg: String) {
        self.hideLoading()
        self.alert(with: msg, titleFirstButton: "OK")
    }
    
}

extension ListPokemonViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listPokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: "cellPokemon", for: indexPath) as! PokemonTableViewCell
        cell.setup(pokemon: listPokemon[indexPath.row], indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.idSelect = indexPath.row+1
        performSegue(withIdentifier: "segueDetailPokemon", sender: nil)
    }
}
