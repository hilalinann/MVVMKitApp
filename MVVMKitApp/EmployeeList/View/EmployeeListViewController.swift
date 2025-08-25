//
//  EmployeeViewController.swift
//  MVVMKitApp
//
//  Created by Hilal İnan on 8.07.2025.
//

import UIKit
import Combine

/*
protocol EmployeeListViewControllerProtocol : AnyObject {
    func reloadData()
}
*/

final class EmployeeListViewController: BaseHostingViewController<EmployeeListContentView,EmployeeListViewModel> {
    
//    override init(contentView: EmployeeListContentView, viewModel: EmployeeListViewModel) {
//            super.init(contentView: contentView, viewModel: viewModel)
//    }
//        
//    @MainActor @preconcurrency required dynamic init?(coder aDecoder: NSCoder) {
//        fatalError("Storyboard init desteklenmiyor. Programmatically başlat.")
//    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //callToViewModelForUpdate()
//    }

    /*
    func callToViewModelForUpdate() {
        self.viewModel
            .employeeListResponse
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Veri çekme hatası: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.viewModel.empData = response
                self.updateDataSource()
                
            })
            .store(in: &employeeListSubscriber)

        self.employeeViewModel.getEmployeeList()
    }

    func updateDataSource() {
        print("updateDataSource() fonksiyonu çağrıldı ")
        
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: self.employeeViewModel.empData.data!, configureCell: { (cell,emd) in
            cell.employeesIdLabel.text = String(emd.id)
            cell.employessNameLabel.text = String(emd.employee_name)
        })
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        employeeViewModel.navigateToEmployeeDetailScreen(index: indexPath.row)
    }
    */
}

/*
extension EmployeeListViewController: EmployeeListViewControllerProtocol {
    func reloadData() {
       
    }
}
*/





/*
class EmployeeListViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var employeeViewModel: EmployeeListViewModelProtocol
    var employeeListSubscriber = Set<AnyCancellable>()
    
    //var employeeViewModel: EmployeeListViewModel!
    
   // lazy var employeeListSubscriber = Set<AnyCancellable>()
    
    private var dataSource : EmployeeTableViewDataSource<EmployeeTableViewCell, EmployeeData>!
    
    init(employeeViewModel: EmployeeListViewModelProtocol) {
        self.employeeViewModel = employeeViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        let router = EmployeeListRouter()
        self.employeeViewModel = EmployeeListViewModel(router: router)
        super.init(coder: coder)
        router.viewController = self
    } //UIViewController super classından gelen zorunlu şey

    /*
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        callToViewModelForUpdate()
    }
    
    func callToViewModelForUpdate() {
    self.employeeViewModel
            .employeeListResponse  //ViewModel’den veri akışını (employeeListResponse) dinler
            .receive(on: DispatchQueue.main) //Ama UI güncellemesi ana thread'de yapılmalı.  Bu satır, gelen veriyi main thread üzerinden işleyeceğini garanti eder.
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Veri çekme hatası: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.employeeViewModel.empData = response //ViewModel’daki empData güncelleniyor.
                self.updateDataSource() //UI’yı (muhtemelen bir tabloyu) güncelleyen fonksiyon.
                
            })
            .store(in: &employeeListSubscriber)

        self.employeeViewModel.getEmployeeList()
    }
    
    /*
    func callToViewModelForUpdate() {
            self.employeeViewModel
                .employeeListResponse
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Error: \(error.localizedDescription)")
                    }
                }, receiveValue: { [weak self] response in
                    guard let weakSelf = self else { return }
                    weakSelf.employeeViewModel.empData = response

                    weakSelf.updateDataSource()
                    //weakSelf.updateDataSource()
                }).store(in: &employeeListSubscriber)

        }
     */
    
        func updateDataSource() {
            print("updateDataSource() fonksiyonu çağrıldı ")
            
            self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: self.employeeViewModel.empData.data!, configureCell: { (cell,emd) in
                cell.employeesIdLabel.text = String(emd.id)
                cell.employessNameLabel.text = String(emd.employee_name)
            })
            
            DispatchQueue.main.async {
                self.tableView.dataSource = self.dataSource
                self.tableView.reloadData()
            }
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            employeeViewModel.navigateToEmployeeDetailScreen(index: indexPath.row)
        }
        
    }
*/


/*
 
 sink operatörü:
Combine’da bir abone oluşturur.
İki closure alır:
receiveCompletion: Akışın tamamlandığı ya da hata geldiği yer.
receiveValue: Veri geldiği anda çalışır.

 Burada:
 items: [Employee] dizisi, yani birden fazla çalışan.
 configureCell: bu dizideki her bir Employee nesnesi için çalışır.
 İşte bu her bir Employee nesnesi, closure içinde emd ismiyle temsil ediliyor.
 
 cell → EmployeeTableViewCell tipinde bir nesnedir.
 Bu hücre, UITableView üzerinde görünen kutucuktur.
 İçinde etiketler (UILabel) olabilir:
 employeesIdLabel
 employessNameLabel
 Sen burada bu etiketlerin içini dolduruyorsun.
 
 self.employeeViewModel.empData = response //ViewModel’daki empData güncelleniyor. :
 Gelen güncel çalışan listesi (response) ViewModel’deki empData'ya atanır ki ViewModel her zaman güncel veriye sahip olsun. Bu da UI’nın güncellenmesi ve verinin merkezi olarak yönetilmesi için önemlidir.
 Veri Kaynağını Güncellemek İçin
 empData, ViewModel’daki çalışan listesi verisini tutan bir değişken.
 response, Combine akışından (publisher’dan) gelen güncel çalışan verisi.
 Gelen yeni veriyi ViewModel’e atıyoruz ki ViewModel her zaman güncel veriyi tutsun.
 2. Verinin Merkezi Yönetimi
 MVVM’de ViewModel, View’a (ViewController’a) veriyi sağlayan tek gerçek kaynakdır.
 ViewModel’deki empData güncellenince:
 İleride ViewController veya başka bileşenler empData üzerinden veriye erişebilir.
 Ayrıca gerektiğinde veriyi başka yerlerde kullanmak, filtrelemek, işlemek mümkün olur.




 */
