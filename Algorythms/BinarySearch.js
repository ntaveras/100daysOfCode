class BinarySearch{

    doSearch(orderedList, target) {
        let lowerLimit = 0;
        let upperLimit = orderedList.length-1;
        let searchIndex;
        while(lowerLimit <= upperLimit) {
            searchIndex = lowerLimit + Math.floor((upperLimit-lowerLimit)/2);
            if(orderedList[searchIndex] ==  target) {return searchIndex;}
            if(orderedList[searchIndex] >  target) {upperLimit = searchIndex-1;}
            if(orderedList[searchIndex] <  target) {lowerLimit = searchIndex +1}
        }
        return -1;
    }
}
const obj = new BinarySearch();
const result = obj.doSearch(new Array(1,2,3,4,5,6,7,8,9,10), 10);
console.log(`Index = ${result == -1 ? 'Not Found' : result}`);
