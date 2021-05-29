//
//  ViewController.swift
//  Jogo da Forca
//
//  Created by TecWeb on 25/05/21.
//

import UIKit

class MainController: UIViewController {
    @IBOutlet var imageView: UIImageView!

    //var palavra = ["angela", "pdm", "valeria"]
    //var dicas = ["Meu nome", "Sigla da disciplina", "Nome da professora"]
    @IBOutlet weak var lbDica: UILabel!
    
    @IBOutlet weak var lbQtdeLetras: UILabel!
    
    @IBOutlet weak var lbLetrasJogadas: UILabel!
    @IBOutlet weak var lbTentativas: UILabel!
    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var tfLetra: UITextField!
    var forca: Forca!
    @IBAction func jogar(_ sender: Any) {
        let letra = Character(self.tfLetra.text!)
        self.forca.jogar(letra: letra)
        self.atualizar()
        if (self.forca.terminou()){
            let rvc = self.storyboard?.instantiateViewController(identifier: "view_resultado") as! ResultadoViewController
            rvc.resultado = self.forca.resultado()
            self.present(rvc, animated: true, completion: nil)
            self.reiniciar()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.forca = Forca(palavra: "ANGELA", dica: "Meu nome")
        self.atualizar()
    }
    func reiniciar(){
        self.forca.tentativa = 0
        self.tfLetra.text = ""
        self.forca.letras = Array()
        self.atualizar()
    }
    func atualizar(){
        self.lbDica.text = self.forca.dica
        self.lbQtdeLetras.text = "Quantidade: \(self.forca.palavra.count) letras."
        self.lbLetrasJogadas.text = String(self.forca.letras)
        self.lbTentativas.text = "Tentativas restantes? \(10 - self.forca.tentativa)"
        self.lbStatus.text = String(self.forca.status)
        self.imagem()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(true)
        self.atualizar()
    }
    func imagem() {
        switch self.forca.tentativa {
        case 10:
                self.imageView.image = UIImage(named: "f10")
        case 9:
            self.imageView.image = UIImage(named: "f9")
        case 8:
            self.imageView.image = UIImage(named: "f8")
        case 7:
            self.imageView.image = UIImage(named: "f7")
        case 6:
            self.imageView.image = UIImage(named: "f6")
        case 5:
            self.imageView.image = UIImage(named: "f5")
        case 4:
            self.imageView.image = UIImage(named: "f4")
        case 3:
            self.imageView.image = UIImage(named: "f3")
        case 2:
            self.imageView.image = UIImage(named: "f2")
        case 1:
            self.imageView.image = UIImage(named: "f1")
        default:
            self.imageView.image = UIImage(named: "f0")
    }
    
}
}
