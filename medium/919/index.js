/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
function TreeNode(val, left, right) {
    this.val = (val===undefined ? 0 : val)
    this.left = (left===undefined ? null : left)
    this.right = (right===undefined ? null : right)
}
/**
 * @param {TreeNode} root
 */
 var CBTInserter = function(root) {
    this._root = root
    this._node = root
    this._queue = []
    this.initQueue()
};

/** 
 * @param {number} val
 * @return {number}
 */
CBTInserter.prototype.insert = function(val) {
    const node = new TreeNode(val)
    let parent = null
    while(parent == null){
        if(this._node.left == null){
            parent = this._node
            this._node.left = node
            this._queue.push(node)
        }else{
            if(this._node.right == null){
                parent = this._node
                this._node.right = node
                this._queue.push(node)
            }else{
                this._node = this._queue.shift()
            }
        }
    }
    return this._node.val
};

/** 
 * @return {number}
 */
CBTInserter.prototype.initQueue = function() {
    const queue = []
    queue.push(this._root)
    while(queue.length > 0){
        const node = queue.shift()
        if(node.left != null){
            this._queue.push(node.left)
            queue.push(node.left)
        }
        if(node.right != null){
            this._queue.push(node.right)
            queue.push(node.right)
        }
    }
};

/**
 * @return {TreeNode}
 */
CBTInserter.prototype.get_root = function() {
    return this._root
};

/** 
 * Your CBTInserter object will be instantiated and called as such:
 * var obj = new CBTInserter(root)
 * var param_1 = obj.insert(val)
 * var param_2 = obj.get_root()
 */

// export {TreeNode, CBTInserter}