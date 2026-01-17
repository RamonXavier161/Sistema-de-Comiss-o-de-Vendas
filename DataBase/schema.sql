CREATE TABLE `vendas` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `valor` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `hora` varchar(20) DEFAULT NULL,
  `cod_usuario` int DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `usuarios` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
