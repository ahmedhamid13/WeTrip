const form = document.querySelector('#new_book');
const adult_price = document.getElementById("adult_price").value;
const child_price = document.getElementById("child_price").value;

function count(){
    let adults_count = document.getElementById("book_trip_adults").value;
    let children_count = document.getElementById("book_trip_children").value;
    let total_count = document.getElementById("total_count");

    total_count.innerHTML = `Total cost ${adults_count*adult_price + children_count*child_price}`
}

form.addEventListener('change', function() {
    count();
});