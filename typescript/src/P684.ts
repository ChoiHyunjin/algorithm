function findRedundantConnection(edges: number[][]): number[] {
    let res: number[] = []

    const list: NewNode[] = new Array(edges.length)

    for(let edge of edges){
        if(list[edge[0]] == null){
            list[edge[0]] = new NewNode(edge[0])
        }
        if(list[edge[1]] == null){
            list[edge[1]] = new NewNode(edge[1])
        }
        list[edge[0]].link(list[edge[1]])
        list[edge[1]].link(list[edge[0]])
    }

    let isRemoved = true
    while(isRemoved){
        isRemoved = false
        for(let i=0;i<edges.length; ){
            const edge = edges[i]
            let removed = false
            if(list[edge[0]].getLinkCount() === 1){
                const removedEdge = list[edge[0]].popEdge()
                removedEdge?.unlink(list[edge[0]])
                removed = true
            }else if(list[edge[1]].getLinkCount() === 1){
                const removedEdge = list[edge[1]].popEdge()
                removedEdge?.unlink(list[edge[1]])
                removed = true
            }
            if(!removed){
                i+=1
            }else {
                edges.splice(i, 1)
            }
            isRemoved = isRemoved || removed
        }
    }

    for(let i=edges.length-1 ; i>=0 ; i-=1){
        const edge = edges[i]
        if(list[edge[0]].getLinkCount() > 1 && list[edge[1]].getLinkCount() > 1 ){
            return edge
        }
    }

    return res
}

function findRedundantConnection2(edges: number[][]): number[] {
    let res: number[] = []

    const map = new Map<number, NewNode>()
    let countMap = new Map<number, NewNode[]>()

    for(let edge of edges){
        for(const e of edge){
            if(!map.has(e)){
                map.set(e, new NewNode(e))
            }
        }
        const n1 = map.get(edge[0])!
        const n2 = map.get(edge[1])!
        n1.link(n2)
        n2.link(n1)
    }

    map.forEach((node: NewNode, key: number) => {
        const count = node.getLinkCount()
        if(!countMap.has(count)){
            countMap.set(count, [])
        }
        const arr = countMap.get(count)
        arr?.push(node)
    })

    while((countMap.get(1) ?? []).length > 0){
        const arr = countMap.get(1)!
        countMap.delete(1)
        for(let node of arr){
            const removedNode = node.popEdge()!
            const count = removedNode.getLinkCount()
            removedNode?.unlink(node)
            
            const idx = countMap.get(count)?.indexOf(removedNode) ?? 0
            countMap.get(count)?.splice(idx, 1)
            let newArr = countMap.get(count-1)
            if(newArr == null){
                newArr = []
                countMap.set(count-1, newArr)
            }
            newArr.push(removedNode)
        }
    }

    for(let i=edges.length-1 ; i>=0 ; i-=1){
        const edge = edges[i]
        if(map.get(edge[0])!.getLinkCount() > 1 && map.get(edge[1])!.getLinkCount() > 1 ){
            return edge
        }
    }

    return res
}

class NewNode {
    private _linked: NewNode[]
    value: number

    constructor(value: number){
        this._linked = []
        this.value = value
    }

    link(edge: NewNode){
        this._linked.push(edge)
    }

    getLinkCount(){
        return this._linked.length
    }

    popEdge(){
        return this._linked.pop()
    }

    unlink(edge: NewNode){
        const idx = this._linked.indexOf(edge)
        this._linked.splice(idx, 1)
    }
}
