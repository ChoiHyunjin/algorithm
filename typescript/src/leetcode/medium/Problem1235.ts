function jobScheduling(startTime: number[], endTime: number[], profit: number[]): number {
    let roots : Node2[] = []
    let nodes : Node2[] = []
    for(let i=0 ; i<startTime.length ; i+=1){
        const node = new Node2(startTime[i], endTime[i], profit[i])
        nodes.push(node)
    }
    nodes.sort((prev: Node2, curr: Node2) => prev.start-curr.start)

    // for(let node of nodes){
    //     let isLinked = false
    //     for(let root of roots){
    //         isLinked = root.linkNode(node) || isLinked
    //     }
    //     if(!isLinked){
    //         roots.push(node)
    //     }
    // }

    for(let i=nodes.length-1; i>=0 ; i-=1){
        let node = nodes[i]
        let rootsWillRemove: number[] = []
        for(let i=0; i< roots.length ; i+=1){
            const root = roots[i]
            if(root.start >= node.end){
                node.children.push(root)
                rootsWillRemove.push(i)
            }
        }
        let rootsTemp = [node]
        for(let k=0; k<=rootsWillRemove.length ; k+=1){
            const index = k-1 < 0 ? 0 : rootsWillRemove[k-1]
            const next = k === rootsWillRemove.length ? rootsWillRemove.length-1 : rootsWillRemove[k]
            for(let j=index ; j<roots.length; j+=1){
                if(next === j){
                    break
                }
                rootsTemp.push(roots[j])
            }
        }
        roots = rootsTemp
    }

    const node = roots.reduce((prev: Node2, curr: Node2) => {
        return prev.max < curr.max ? curr: prev
    })
    return node.max
};

class Node2{
    start: number
    end: number
    profit: number
    children: Node2[]
    _max: number

    constructor(start: number, end: number, profit: number){
        this.start = start;
        this.end = end;
        this.profit = profit;
        this.children = [];
        this._max = 0
    }

    get max(): number{
        return this._max || this.getMax();
    }

    private getMax(): number{
        let res = 0

        if(this.children.length > 0){
            res = this.children.reduce((prev: Node2, curr:Node2) => {
                return prev.max < curr.max ? curr: prev
            }).max
        }

        this._max = res + this.profit;
        return this._max;
    }

    linkNode(node: Node2): boolean{
        let res = false
        if(this.children.length > 0){
            this.children.forEach(child => {
                res = child.linkNode(node) || res
            })
        }
        if(!res && this.end <= node.start){
            this.children.push(node)
            res = true
        }
        return res
    }
}

export default class Problem1235{
    sol = jobScheduling
}

const obj = new Problem1235()
console.log(obj.sol([24,24,7,2,1,13,6,14,18,24],
    [27,27,20,7,14,22,20,24,19,27],
    [6,1,4,2,3,6,5,6,9,8]))