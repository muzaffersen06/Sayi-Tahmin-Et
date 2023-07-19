//
//  TahminEkraniVC.swift
//  Sayı Tahmin Et
//
//  Created by Muzaffer Baran on 19.07.2023.
//

import UIKit

class TahminEkraniVC: UIViewController {
    
    @IBOutlet weak var labelKalanHak: UILabel!
    @IBOutlet weak var labelYardim: UILabel!
    @IBOutlet weak var textfieldGirdi: UITextField!
    
    var rastgeleSayi:Int?
    var kalanHak = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rastgeleSayi = Int(arc4random_uniform(100))//0-100 arasında sayı uretecek
        print("Rasgele Sayı : \(rastgeleSayi!)")//bu kod konsolda gormek ıcın yazmasanda olur
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let gelenVeri = sender as? Bool {
            let gidilecekVC = segue.destination as! SonucEkraniVC
            
            gidilecekVC.sonuc = gelenVeri
        }
    }
    
    @IBAction func tahminet(_ sender: Any) {
        labelYardim.isHidden = false
        kalanHak-=1 //kalan hakkı azaltmak icin
        
        if let veri = textfieldGirdi.text { //veriyi aldık
            if let tahmin = Int(veri){ //donusum yaptık
                
                if kalanHak != 0 { //kalan hakkım 0 degilse bu kodu calıstır.
                    
                    if tahmin == rastgeleSayi { // tahmin rastgele sayıya esitse direkt sayfa gecisi yapmamız gerek
                        let sonuc = true
                        performSegue(withIdentifier: "tahminTosonuc", sender: sonuc)//Bu kod sayfa gecisi yapar
                    
                    }
                    
                    if tahmin > rastgeleSayi! { //tahmin rastgele sayıdan buyukse
                        
                        labelYardim.text = "Azalt"
                        labelKalanHak.text = "Kalan Hak : \(kalanHak)"//sayac kalan hakkı degistirmesi icin yazdım
                    }
                    
                    if tahmin < rastgeleSayi! { // tahmin rastgele sayıdan kucukse
                        
                        labelYardim.text = "Arttır"
                        labelKalanHak.text = "Kalan Hak : \(kalanHak)"//sayac kalan hakkı degistirmesi icin yazdım
                    }
                    
                    
                }else{
                    let sonuc = false
                    performSegue(withIdentifier: "tahminTosonuc", sender: sonuc)//Bu kod sayfa gecisi yapar
                    
                }
                
                textfieldGirdi.text = ""
            }
        }
    }
    
}
