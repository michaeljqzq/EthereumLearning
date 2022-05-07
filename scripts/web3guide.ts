var contract = web3.eth.contract(contractABI).at(contractAddress);
var callData = contract.functionName.getData(functionParameters);
var result = web3.eth.call({
    to: "0x692a70d2e424a56d2c6c27aa97d1a86395877b3a", 
    data: callData
});