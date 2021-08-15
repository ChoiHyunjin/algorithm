/**
 * @param {string[][]} tickets
 * @return {string[]}
 */
 var findItinerary = function(tickets) {
    let count = tickets.length
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
    stack.push(map.JFK)
    while(count > 0){
        const node = stack[stack.length-1]
        if(node.goals.length === 0){
            const ptr = ptrStack.pop()
            count += stack.length -1 - ptr
            reload(ptr, stack)
        }else{
            if(node.goals.length > 1){
                ptrStack.push(stack.length-1)
            }
            const to = node.goals.shift()
            stack.push(map[to])
            count -= 1
        }
    }

    return stack.map(item=>item.from)
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

export {Ticket, findItinerary}