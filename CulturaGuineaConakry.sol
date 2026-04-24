// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaGuineaConakry
 * @dev Registro de biotecnologia de micro-cereales y absorcion de salsas de hojas.
 * Serie: Sabores de Africa (47/54)
 */
contract CulturaGuineaConakry {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 precisionVaporizacion; // Control de textura del Fonio (1-100)
        uint256 indiceAbsorcion;      // Capacidad de retencion de salsa (1-10)
        bool usaHojasCamote;          // Base de la salsa "Maffe Hakko"
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con el Fonio con Salsa de Hojas (Ingenieria del Micro-grano)
        registrarPlato(
            "Fonio con Maffe Hakko", 
            "Micro-granos de Fonio, hojas de camote, carne de res, aceite de palma.",
            "Triple vaporizacion del fonio para asegurar expansion sin apelmazamiento; servido con estofado de hojas.",
            98, 
            9, 
            true
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _vapor, 
        uint256 _absorcion,
        bool _hojas
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        require(_vapor <= 100, "Escala de vaporizacion excedida");

        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            precisionVaporizacion: _vapor,
            indiceAbsorcion: _absorcion,
            usaHojasCamote: _hojas,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
