<html> 
    <body> 
        <div
            class='Header'>
            <h1>Elections 2021</h1>
            <p>New Era of Transperancy</p>
            <h2> Candidate List: </h2>
            <ol>
                <li> Alpha - Party A / Voting Code: "1"</li>
                <li> Beta - Party B / Voting Code: "2" </li>
                <li> Theta - Party C / Voting Code: "3" </li>
            </ol>
            <button id='Buy'> BuyTokens</button>
            <input id='amount'Token Amount>
			<input id= 'voteraddress' Voter Address> 
			<!-- <input type="text" id="voteraddress" -->
            <input type='text' id='CandidateChoice'>
            <button id='Vote'> Vote </button>
            <link rel="shortcut icon" href="assets/images/favicon.ico">
        </div>
        <script src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.36/dist/web3.min.js" integrity="sha256-nWBTbvxhJgjslRyuAKJHK+XcZPlCnmIAAMixz6EefVk=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>


        <script>
            var contract;

            $(document).ready(function()
            {
                web3 = new Web3(web3.currentProvider);

                var address = "0x0e3E3eb63105983d277EDB95Abd58F4397485F28";
                var abi =  [
        {
            "constant": false,
            "inputs": [
                {
                    "internalType": "uint256",
                    "name": "amt",
                    "type": "uint256"
                },
                {
                    "internalType": "address",
                    "name": "reciever",
                    "type": "address"
                }
            ],
            "name": "buy",
            "outputs": [
                {
                    "internalType": "uint256",
                    "name": "",
                    "type": "uint256"
                }
            ],
            "payable": true,
            "stateMutability": "payable",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [],
            "name": "CloseVoting",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "internalType": "address",
                    "name": "reciever",
                    "type": "address"
                },
                {
                    "internalType": "uint256",
                    "name": "value",
                    "type": "uint256"
                }
            ],
            "name": "mint",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "internalType": "address",
                    "name": "_voter",
                    "type": "address"
                },
                {
                    "internalType": "string",
                    "name": "_fName",
                    "type": "string"
                },
                {
                    "internalType": "string",
                    "name": "_lName",
                    "type": "string"
                },
                {
                    "internalType": "uint256",
                    "name": "_age",
                    "type": "uint256"
                }
            ],
            "name": "registerVoter",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "inputs": [
                {
                    "internalType": "address[]",
                    "name": "_addresses",
                    "type": "address[]"
                },
                {
                    "internalType": "uint256",
                    "name": "_tokenPrice",
                    "type": "uint256"
                },
                {
                    "internalType": "uint256",
                    "name": "_minToken",
                    "type": "uint256"
                },
                {
                    "internalType": "string",
                    "name": "_symbol",
                    "type": "string"
                }
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "constructor"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "internalType": "enum Voting.Candidates",
                    "name": "_candidate",
                    "type": "uint8"
                }
            ],
            "name": "vote",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "balance",
            "outputs": [
                {
                    "internalType": "uint256",
                    "name": "",
                    "type": "uint256"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "isOpen",
            "outputs": [
                {
                    "internalType": "bool",
                    "name": "",
                    "type": "bool"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "winnerCandidate",
            "outputs": [
                {
                    "internalType": "uint256",
                    "name": "",
                    "type": "uint256"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        }
    ];

            contract = new web3.eth.Contract(abi , address);
        
            $('#Buy').click(function()
            {
                var amt = 0;
                amt = parseInt(1);
				var voteraddress = (($('#voteraddress').val()));
                web3.eth.getAccounts().then(function(accounts)
                {
                    var acc = accounts[0];
                    return contract.methods.buy(amt , voteraddress).send({from: acc});
                }).then(function(tx)
                {
                    console.log(tx);
                }).catch(function(tx)
                {
                    console.log(tx);
                })
			})   
			$("#Vote").click(function()
			{
				// var cand = 0; 
				var cand = (($('#CandidateChoice').val()));
				console.log(cand) 
				web3.eth.getAccounts().then(function(accounts)
				{
					var acc = accounts[0];
					return contract.methods.vote(cand).send({from: acc});
				}).then(function(tx)
				{
					console.log(tx);
					

				}).catch(function(tx)
				{
					console.log(tx);

				})

			})             
        })
        </script>




    </body>
</html>
