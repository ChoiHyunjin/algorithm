class Node2477 {
  children = new Set<Node2477>()
  val: number

  static link = (node1: Node2477, node2: Node2477) => {
    node2.children.add(node1)
    node1.children.add(node2)
  }

  constructor(val: number) {
    this.val = val
  }
}

function minimumFuelCost(roads: number[][], seats: number): number {
  let res = 0
  const nodes: { [key in number]: Node2477 } = {}

  // align
  roads.forEach(([city1, city2]) => {
    if (!nodes[city1]) [(nodes[city1] = new Node2477(city1))]
    if (!nodes[city2]) [(nodes[city2] = new Node2477(city2))]
    Node2477.link(nodes[city1], nodes[city2])
  })

  const dfs = (node: Node2477 | null, parent?: Node2477) => {
    if (!node) {
      return 0
    }

    parent && node.children.delete(parent)
    let count = 1
    node.children.forEach((n) => {
      count += dfs(n, node)
    })
    if (node.val > 0) {
      res += Math.ceil(count / seats)
    }

    return count
  }

  dfs(nodes[0])

  return res
}
