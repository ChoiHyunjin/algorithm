/**
 * @param {string[][]} tickets
 * @return {string[]}
 */
 var findItinerary = function(tickets) {
    const ptrStack = []
    const stack = []
    const map = {}

    tickets.forEach(ticket => {
        const [from, to] = ticket
        if(map[from] == null){
            map[from] = new Ticket(from)
        }
        map[from].addGoal(to)
        if(map[to] == null){
            map[to] = new Ticket(to)
        }
    })

    sortOrder(map)
    dfs('JFK', stack, map)

    return stack.map(item=>item.from).reverse()
};

function Ticket(from){
    this.from = from
    this.goals = []
    this.startCount = 0
}

Ticket.prototype.addGoal = function(to){
    this.goals.push(to)
}

function sortOrder(map){
    const values = Object.values(map)
    values.forEach(item => item.goals.sort())
    const value = []
    value.sort((a,b) => a>b ? 1 : -1)
}

function reload( ptr, stack){
    for(let i = stack.length-1 ; i> ptr ; i-=1){
        const goal = stack[i]
        const from = stack[i-1]
        from.goals.push(goal.from)
    }
    stack.splice(ptr+1)
}

function dfs(start, stack, map){
    const node = map[start]
    while(node.goals.length > 0){
        const to = node.goals.shift()
        dfs(to, stack, map)
    }
    stack.push(node)
}

export {Ticket, findItinerary}