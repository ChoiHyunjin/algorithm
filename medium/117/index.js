/**
 * // Definition for a Node.
 */
function Node2(val, left, right, next) {
    this.val = val === undefined ? null : val;
    this.left = left === undefined ? null : left;
    this.right = right === undefined ? null : right;
    this.next = next === undefined ? null : next;
};

function Queue(){
    this._queue = []
}

Queue.prototype.getQueue = function(){
    return this._queue
}

Queue.prototype.enqueue = function(item){
    this._queue.push(item)
}

Queue.prototype.dequeue = function(){
    return this._queue.shift()
}

/**
 * @param {Node2} root
 * @return {Node2}
 */
 var connect = function(root) {
    if(root.length === 0 ) return []
    
    // let queue = new Queue()
    // let newQueue= new Queue()
    // queue.enqueue(root)
    // // while(queue.getQueue().length > 0){
    // //     const item = queue.dequeue()
    // //     if(queue.getQueue().length === 0) {
    // //         queue = newQueue
    // //         newQueue = new Queue()
    // //         if(item.left) queue.enqueue(item.left)
    // //         if(item.right) queue.enqueue(item.right)
    // //     }else{
    // //         item.next = queue.getQueue()[0]
    // //         if(item.left) newQueue.enqueue(item.left)
    // //         if(item.right) newQueue.enqueue(item.right)
    // //     }
    // // }
    // while(queue.getQueue().length > 0){
    //     const item = queue.dequeue()
    //     if(item.left) newQueue.enqueue(item.left)
    //     if(item.right) newQueue.enqueue(item.right)
    //     if(queue.getQueue().length === 0) {
    //         queue = newQueue
    //         newQueue = new Queue()
    //     }else{
    //         item.next = queue.getQueue()[0]
    //     }
    // }
    // return root
    let queue = []
    let newQueue= []
    queue.push(root)
    while(queue.length > 0){
        const item = queue.shift()
        if(item){
            if(item.left) newQueue.push(item.left)
            if(item.right) newQueue.push(item.right)
            if(queue.length === 0) {
                queue = newQueue
                newQueue = []
            }else{
                item.next = queue[0]
            }
        }
    }
    return root
};

export { Queue, connect}