// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

//Aqui iniciamos o contrato definindo o seu nome
contract VerificaPassageiro {
    
    //esta é a variável que vai armazenar a idade do Passageiro. Esta é 'uint' pois idade é um unsigned integer, ou seja, um inteiro que não possui sinal (positivo ou negativo)
    uint idadePassageiro;
    //esta é a variável que vai armazenar o endereço
    address enderecoPassageiro;


    //este é um tipo de função que é executado assim que deployamos o código. Ela 'prepara' o ambiente
    constructor() {
        //a idade padrão é 18, como pedido no enunciado
        idadePassageiro = 18;
        //aqui capturamos o hash da pessoa que está enviando a mensagem (idade)
        enderecoPassageiro = msg.sender;
    }


    //esta função serve para o passageiro declarar sua idade
    function setIdade(uint _idadePassageiro) external {
        //para isso, o passageiro precisa ser o owner do contrato, como pedido no enunciado
        require(enderecoPassageiro == msg.sender);
        //caso ele passe no requisito acima, dizemos que a idadePassageiro será o seu input
        //'_idadePassageiro' é o input que será feito 
        idadePassageiro = _idadePassageiro;
    }

    //esta é a função utilizada para retornar a idade do passageiro
    function getIdade() public view returns (uint) {
        return idadePassageiro;
    }
}