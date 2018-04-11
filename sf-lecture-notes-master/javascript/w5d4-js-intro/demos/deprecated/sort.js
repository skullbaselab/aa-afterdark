
console.log("lol");
function quicksort(ary, callback) {
    if (ary.length < 2) {
        return ary;
    }
    var pivot = ary[0];
    var rest = ary.slice(1);
    var left = [],
        right = [];
    //rest.each do |num|
    //  left << num if num < pivot
    //  right << num if num >= pivot
    //end
    var eachNumCallback = function(num) {
        if (num < pivot) {
            left.push(num);
        } else {
            right.push(num);
        }
    };

    rest.forEach(eachNumCallback);
    return quicksort(left).concat([pivot]).concat(quicksort(right));
}

quicksort([5, 4, 3, 2, 1]);

var Horse = function(name, legCount) {
    this.name = name;
    this.legCount = legCount;
}

Horse.prototype.dance = function() {
    console.log("shaking my" + this.legCount + " legs");
}
