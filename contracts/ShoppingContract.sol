// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShoppingContract {
    struct Product {
        uint256 id;
        string name;
        uint256 price;
        uint256 quantity;
        bool ProductPurchased;
    }

    mapping(uint256 => Product) public products;

    uint256 public productCount;

    event ProductAdded(uint256 id, string name, uint256 price, uint256 quantity);
    // event ProductPurchased(uint256 id);

    function addProduct(string memory name, uint256 price, uint256 quantity) public {
        require(bytes(name).length > 0, "Name must not be empty");
        require(quantity > 0, "Quantity must be greater than zero");
        productCount++;
        products[productCount] = Product(productCount, name, price, quantity,false);
        emit ProductAdded(productCount, name, price, quantity);
    }

    function buyProduct(uint256 id, uint256 quantity) public payable {
        Product storage product = products[id];
        require(product.id != 0, "Product does not exist");
        require(product.quantity >= quantity, "Not enough quantity available");
        require(msg.value >= product.price * quantity, "Insufficient funds");

        product.quantity -= quantity;
        payable(msg.sender).transfer(msg.value);
        product.ProductPurchased = true;
    }
}
