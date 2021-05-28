
class Gem {
    static name
    static prize
    static lvlReq

    __New(name, prize, lvlReq) {
        MsgBox, test
        this.name := name
        this.prize := prize
        this.lvlReq := lvlReq
    }
}