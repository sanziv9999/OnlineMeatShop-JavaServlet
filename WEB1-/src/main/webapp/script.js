
function addToCart(productId, productName, priceAfterDiscount) {
    updateCart();
    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    let product = {
        id: productId,
        name: productName,
        price: priceAfterDiscount,
        quantity: 1
    };

    let productIndex = -1;
    for (let i = 0; i < cart.length; i++) {
        if (cart[i].id === product.id) {
            productIndex = i;
            break;
        }
    }

    if (productIndex === -1) {
        cart.push(product);
    } else {
        cart[productIndex].quantity++;
    }

    localStorage.setItem("cart", JSON.stringify(cart));
    updateCart();
    alert("Product added to cart successfully!");
}

$(document).ready(function (){
    updateCart();
})

function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0) {
        console.log("cart is empty")
        $(".cart-items").html("(0)");
        $(".cart-body").html("<p style='font-size: 20px; color: #555;'>There are no items in the cart.</p>");
        $(".checkout").prop('disabled', true);
    } else {
        console.log(cart)
        $(".cart-items").html(`(${cart.length})`);
        let table = `
            <table class='table'>
            <thread class="thread-light">
                <tr>
                    <th>Item Name</th>
                    <th>Item Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Action</th>
                </tr>
            </thread>`;
        let totalPrice = 0;
        cart.map((item) => {
            table += `
                <tr>
                    <td>${item.name}</td>
                    <td>Rs.${item.price}</td>
                     <td>
                        <button class="btn btn-danger btn-sm" onclick="decreaseQuantity(${item.id})">-</button>
                        <span>${item.quantity}</span>
                        <button class="btn btn-danger btn-sm" onclick="increaseQuantity(${item.id})">+</button>
                    </td>
                    <td>Rs.${item.price * item.quantity}</td>
                    <td><button class="btn btn-danger btn-sm"><span onclick="deleteItem(${item.id})">Remove</span></button></td>
                </tr>`
            totalPrice += item.price * item.quantity
        })

        table = table + `
            <tr class="m-5">
                <td colspan='5' class="text-right font-weight-bold">Total Price: Rs. ${totalPrice}</td>
                <td></td>
            </tr>
            </table>`
        $(".cart-body").html(table);
        $(".checkout").prop('disabled', false);
    }
}

function deleteItem(productId){
    let cart= JSON.parse(localStorage.getItem('cart'));
    let newCart = cart.filter((item)=>item.id != productId)
    localStorage.setItem('cart',JSON.stringify(newCart))
    updateCart();
    alert("Product removed from cart successfully!");
}

function increaseQuantity(productId) {
    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    for (let i = 0; i < cart.length; i++) {
        if (cart[i].id === productId) {
            cart[i].quantity++;
            break;
        }
    }

    localStorage.setItem("cart", JSON.stringify(cart));
    updateCart();
}

function decreaseQuantity(productId) {
    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    for (let i = 0; i < cart.length; i++) {
        if (cart[i].id === productId) {
            if (cart[i].quantity > 1) {

                cart[i].quantity--;
            } else {
                cart.splice(i, 1);
            }
            break;
        }
    }

    localStorage.setItem("cart", JSON.stringify(cart));
    updateCart();
}






