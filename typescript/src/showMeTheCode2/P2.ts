import fs = require('fs')

var input = fs.readFileSync('./stdin').toString().split(/\r?\n/)
const SIZE = 7
const value = parseInt(input[SIZE])

class Map{
    private _map: number[][] = []
    private removable: number[][] = []

    constructor(input: string[]){
        for(let i=0 ; i<SIZE; i+=1){
            this._map[i] = input[SIZE-1-i].split(' ').map(str => parseInt(str))
        }
    }
    
    count(){
        let res = 0
        for(let i=0 ; i<SIZE; i+=1){
            for(let j=0 ; j<SIZE; j+=1){
                res += this._map[i][j] > 0 ? 1 : 0
            }
        }
    
        return res
    }

    input(val: number, x: number){
        let isLanding = false
        if(this._map[6][x] > 0 ) return isLanding

        for(let i=SIZE-1 ; i>=0; i-=1){
            if(this._map[i][x] === 0){
                continue
            }
            this._map[i+1][x] = val
            isLanding = true
            break
        }
        if(!isLanding){
            this._map[0][x] = val
            isLanding = true
        }
        return isLanding
    }

    execute(){
        this.checkHorizontal()
        this.checkVertical()

        while(this.removable.length > 0){
            this.removeAll()
            this.rerange()
            this.checkHorizontal()
            this.checkVertical()
        }
    }

    private checkVertical(){
        for(let x = 0 ; x < SIZE ; x+=1){
            if(this._map[0][x] === 0){
                continue
            }
            let size = 1
            for(let y = 1 ; y < SIZE ; y+=1){
                if(this._map[y][x] === 0){
                    size = y
                    break
                }
            }
            
            for(let y = 0 ; y < SIZE ; y+=1){
                if(this._map[y][x] === size){
                    this.removable.push([x, y])
                }
            }
        }
    }

    private checkHorizontal(){
        for(let y = 0 ; y < SIZE ; y+=1){
            let size = 0
            let start = -1
            for(let x = 0 ; x < SIZE ; x+=1){            
                if(this._map[y][x] === 0){
                    if(size > 0){
                        for(let x2 = start ; x2 < start+size ; x2+=1){
                            if(this._map[y][x2] === size){
                                this.removable.push([x2, y])
                            }
                        }

                        x += size
                        size = 0
                        start = -1
                    }
                    continue
                }

                if(size === 0){
                    start = x
                }
                size += 1
            }
            if(size > 0){
                for(let x = start ; x < start+size ; x+=1){
                    if(this._map[y][x] === size){
                        this.removable.push([x, y])
                    }
                }
            }
        }
    }

    private rerange(){
        for(let x=0; x<SIZE ; x += 1){
            for(let y=0 ; y<SIZE; y+=1){
                if(this._map[y][x] > 0){
                    continue
                }
                for(let y2 = y ; y2<SIZE-1 ; y2 += 1){
                    this._map[y2][x] = this._map[y2+1][x]
                }
                this._map[6][x] = 0
            }
        }
    }

    private removeAll(){
        this.removable.map((pos : number[]) => {
            this._map[pos[1]][pos[0]] = 0
        })
        this.removable = []
    }
}

let res = SIZE*SIZE
for (let i=0 ; i< SIZE ; i+=1){
    const map = new Map(input)
    const able = map.input(value, i)
    if(!able){
        continue
    }
    map.execute()
    res = Math.min(res, map.count())
}
console.log(res)