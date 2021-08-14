/**
 * @param {string} path
 * @return {string}
 */
 var simplifyPath = function(path) {
    const paths = path.split('/')
    console.log(paths)
    const res = []

    for(let i = 0 ; i < paths.length ; i += 1){
        const p = paths[i]
        switch(p){
            case '.':
            case '':
            break
            case '..':
                res.pop()
            break
            default:
                res.push(p)
            break
        }
    }

    return '/'+res.join('/')
};

simplifyPath('/home/')