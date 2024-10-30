1. -- Quantos clientes estão cadastrados no sistema?
SELECT COUNT(*) AS Total_Clientes
FROM Clientes;

2. -- Liste todos os produtos que possuem mais de 50 unidades em estoque.
SELECT *
FROM Produtos
WHERE Estoque > 50;

3. -- Exiba o total de vendas realizadas por cada cliente.
SELECT c.Nome, COUNT(v.Venda_ID) AS Total_Vendas
FROM Clientes c
LEFT JOIN Vendas v ON c.Cliente_ID = v.Cliente_ID
GROUP BY c.Nome;

4. -- Liste todos os clientes cadastrados nos últimos 30 dias.
SELECT *
FROM Clientes
WHERE Data_Cadastro >= NOW() - INTERVAL 30 DAY;

5. -- Exiba o nome dos clientes junto com as cidades de seus respectivos endereços.
SELECT c.Nome, e.Cidade
FROM Clientes c
JOIN Enderecos e ON c.Cliente_ID = e.Cliente_ID;

6. -- Liste os produtos vendidos em cada venda, incluindo o nome do produto e a quantidade.
SELECT v.Venda_ID, p.Nome AS Nome_Produto, iv.Quantidade
FROM Itens_Vendas iv
JOIN Produtos p ON iv.Produto_ID = p.Produto_ID
JOIN Vendas v ON iv.Venda_ID = v.Venda_ID;

7. -- Mostre o total de produtos disponíveis em cada categoria.
SELECT c.Nome AS Categoria, SUM(p.Estoque) AS Total_Produtos
FROM Categorias c
JOIN Produtos p ON c.Categoria_ID = p.Categoria_ID
GROUP BY c.Nome;

8. -- Exiba o total de produtos vendidos por cada fornecedor.
SELECT f.Nome AS Fornecedor, SUM(iv.Quantidade) AS Total_Vendidos
FROM Fornecedores f
JOIN Produtos p ON f.Fornecedor_ID = p.Fornecedor_ID
JOIN Itens_Vendas iv ON p.Produto_ID = iv.Produto_ID
GROUP BY f.Nome;

9. -- Calcule o valor total de vendas para cada dia.
SELECT DATE(v.Data_Venda) AS Data, SUM(iv.Quantidade * iv.Preco_Unitario) AS Total_Vendas
FROM Vendas v
JOIN Itens_Vendas iv ON v.Venda_ID = iv.Venda_ID
GROUP BY DATE(v.Data_Venda);

10. -- Liste os clientes que possuem pedidos com status "Pendente".
SELECT DISTINCT c.Nome
FROM Clientes c
JOIN Vendas v ON c.Cliente_ID = v.Cliente_ID
JOIN Status_Pedido sp ON v.Status_Pedido_ID = sp.Status_Pedido_ID
WHERE sp.Descricao = 'Pendente';

11. -- Exiba o nome do cliente e a lista de produtos atualmente em seu carrinho.
SELECT c.Nome AS Cliente, p.Nome AS Produto
FROM Carrinho ca
JOIN Clientes c ON ca.Cliente_ID = c.Cliente_ID
JOIN Produtos p ON ca.Produto_ID = p.Produto_ID;

12. -- Calcule o preço médio dos produtos para cada categoria.
SELECT c.Nome AS Categoria, AVG(p.Preco) AS Preco_Medio
FROM Categorias c
JOIN Produtos p ON c.Categoria_ID = p.Categoria_ID
GROUP BY c.Nome;

13. -- Qual é o total de todos os produtos vendidos no sistema?
SELECT SUM(iv.Quantidade) AS Total_Produtos_Vendidos
FROM Itens_Vendas iv;

14. -- Liste os clientes que realizaram mais de três compras.
SELECT c.Nome
FROM Clientes c
JOIN Vendas v ON c.Cliente_ID = v.Cliente_ID
GROUP BY c.Cliente_ID
HAVING COUNT(v.Venda_ID) > 3;

15. -- Exiba o total de vendas agrupado pelo status de cada pedido.
SELECT sp.Descricao AS Status_Pedido, SUM(iv.Quantidade * iv.Preco_Unitario) AS Total_Vendas
FROM Vendas v
JOIN Itens_Vendas iv ON v.Venda_ID = iv.Venda_ID
JOIN Status_Pedido sp ON v.Status_Pedido_ID = sp.Status_Pedido_ID
GROUP BY sp.Descricao;