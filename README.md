Step 1: Install New NPM Packages
Continuing from our previous project at ~/Ethereum/demo:

cd in projct location
```npm install```

```truffle init```

Step 2: Create the .env File
Using your favorite editor, create a new file called .env. Insert these 2 lines:

```
INFURA_KEY=<infura_key>
TEST_MNEMONIC=<12-word_mnemonic_of_your_ether_wallet>
```

SETUP you menomic and infura apikey

Step 4: Deploy to Ropsten!
With our new configurations set up, we are now ready to deploy. In your terminal, execute:

```truffle deploy --network ropsten-infura --reset```

Step 5: Did It Work?
Now that it's supposedly deployed, let's verify it. In your terminal, execute:

```truffle console --network ropsten-infura```

To get the contract object

```var carshop; CarShop.at("contract_address").then( function(x) { carshop = x });```

to invoke a function

```carshop.addCarToInventory(200)```

