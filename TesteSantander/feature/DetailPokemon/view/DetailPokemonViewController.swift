import UIKit

class DetailPokemonViewController: UIViewController {
    
    @IBOutlet var tbView: UITableView!
    
    //MARK: - Attributes -
    var navigation: UINavigationController?
    var presenterInterface: DetailPokemonPresenterInterface!
    
    var _detailPokemon:DetailPokemon?
    
    var idSelect:Int = 1
    
    //MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLoading()
        DetailPokemonWireframe.setUp(vc: self)
        setup();
        self.presenterInterface.loadDetailPokemon(id: idSelect)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func setup() {
        self.setUpStatusBarBackgroudColorWhenIOS13()
   
        self.tbView.delegate = self
        self.tbView.dataSource = self
        
        let nib = UINib(nibName: "DetailPokemonTableViewCell", bundle: nil)
        self.tbView.register(nib, forCellReuseIdentifier: "cellDetail")
        
        self.tbView.tableFooterView = UIView()
        self.tbView.reloadData()
        self.view.addSubview(self.tbView)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func unwindHome(_ segue: UIStoryboardSegue) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension DetailPokemonViewController: DetailPokemonPresenterViewInterface {
    func fetchDetailPokemon(detail: DetailPokemon) {
        self._detailPokemon = detail
        self.tbView.reloadData()
        self.hideLoading()
    }
    
    
    func failure(msg: String) {
        self.hideLoading()
        self.alert(with: nil,
                   message: msg,
                   titleFirstButton: "OK",
                   callbackFirstButton: { (action) in
            self.navigationController?.popViewController(animated: true)
        }, callbackSecondButton: nil)
    }
}

extension DetailPokemonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let detail = _detailPokemon{
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tbView.dequeueReusableCell(withIdentifier: "cellDetail", for: indexPath) as! DetailPokemonTableViewCell
        cell.setup(detail: self._detailPokemon!, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
