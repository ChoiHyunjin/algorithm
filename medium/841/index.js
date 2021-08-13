/**
 * @param {number[][]} rooms
 * @return {boolean}
 */
var canVisitAllRooms = function(rooms) {
    const map = new Array(rooms.length).fill(0)
    const keys = new Array(rooms.length).fill(0)

    setKeys(keys, rooms[0])
    map[0] = 1

    let roomNum = getKeyOfNotOpenedRoom(map, keys)
    while(roomNum > 0) {
        map[roomNum] = 1
        setKeys(keys, rooms[roomNum])
        roomNum = getKeyOfNotOpenedRoom(map, keys)
    }

    return map.every(r => r>0)
}

function setKeys(keyMap, keys){
    keys.forEach(key => {
        keyMap[key] = 1
    })
}

function getKeyOfNotOpenedRoom(map, keys){
    return keys.findIndex((key,index) => (key > 0 && map[index] === 0))
}

export default canVisitAllRooms
export {setKeys, getKeyOfNotOpenedRoom}