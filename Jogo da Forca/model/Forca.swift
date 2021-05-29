
import Foundation

class Forca {
    var palavra: Array<Character>
    var dica: String
    var tentativa: Int
    var letras: Array<Character>
    var status: Array<Character>
    
    init(palavra: String, dica: String) {
        self.palavra = Array(palavra)
        self.dica = dica
        self.tentativa = 0
        self.letras = Array()
        self.status = Array(repeating: "_", count: self.palavra.count)
    }
    func jogadaValida(letra: Character) -> Bool {
        return !self.letras.contains(letra) && self.palavra.contains(letra) && self.tentativa < 10
    }
    func jogar(letra: Character) {
        if (self.jogadaValida(letra: letra)) {
            self.letras.append(letra)
            for i in 0..<self.palavra.count{
                if (self.palavra[i] == letra) {
                    self.status[i] = letra
                }
            }
        }else {
            self.tentativa += 1
        }
    }
    func terminou() -> Bool {
        return self.palavra == self.status || self.tentativa >= 10
    }
    func resultado() -> String {
        if(self.terminou()){
            if(self.palavra == self.status){
                return "Ganhou"
            }else{
                return "Perdeu"
            }
        }else{
            return "Jogo nao terminou"
        }
    }
}
