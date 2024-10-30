CREATE TABLE Itens_Vendas (
    Item_ID INT PRIMARY KEY,
    Venda_ID INT,
    Produto_ID INT,
    Quantidade INT,
    Preco_Unitario FLOAT,
    FOREIGN KEY (Venda_ID) REFERENCES Vendas(Venda_ID),
    FOREIGN KEY (Produto_ID) REFERENCES Produtos(Produto_ID)
);

CREATE TABLE Enderecos (
    Endereco_ID INT PRIMARY KEY,
    Cliente_ID INT,
    Rua VARCHAR(255),
    Numero INT,
    Cidade VARCHAR(100),
    Estado VARCHAR(100),
    CEP VARCHAR(10),
    FOREIGN KEY (Cliente_ID) REFERENCES Clientes(Cliente_ID)
);

CREATE TABLE Pagamentos (
    Pagamento_ID INT PRIMARY KEY,
    Venda_ID INT,
    Data_Pagamento DATE,
    Valor_Pago FLOAT,
    Metodo_Pagamento VARCHAR(50),
    FOREIGN KEY (Venda_ID) REFERENCES Vendas(Venda_ID)
);

CREATE TABLE Status_Pedido (
    Status_Pedido_ID INT PRIMARY KEY,
    Descricao VARCHAR(100)
);

CREATE TABLE Vendas (
    Venda_ID INT PRIMARY KEY,
    Cliente_ID INT,
    Data_Venda DATE,
    Status_Pedido_ID INT,
    FOREIGN KEY (Cliente_ID) REFERENCES Clientes(Cliente_ID),
    FOREIGN KEY (Status_Pedido_ID) REFERENCES Status_Pedido(Status_Pedido_ID)
);

CREATE TABLE Categorias (
    Categoria_ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Descricao VARCHAR(255)
);

CREATE TABLE Fornecedores (
    Fornecedor_ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Contato VARCHAR(100),
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Clientes (
    Cliente_ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Telefone VARCHAR(15),
    Data_Cadastro DATE
);

CREATE TABLE Carrinho (
    Carrinho_ID INT PRIMARY KEY,
    Cliente_ID INT,
    Produto_ID INT,
    Quantidade INT,
    FOREIGN KEY (Cliente_ID) REFERENCES Clientes(Cliente_ID),
    FOREIGN KEY (Produto_ID) REFERENCES Produtos(Produto_ID)
);

CREATE TABLE Produtos (
    Produto_ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Descricao VARCHAR(255),
    Preco FLOAT,
    Estoque INT,
    Categoria_ID INT,
    Fornecedor_ID INT,
    FOREIGN KEY (Categoria_ID) REFERENCES Categorias(Categoria_ID),
    FOREIGN KEY (Fornecedor_ID) REFERENCES Fornecedores(Fornecedor_ID)
);
