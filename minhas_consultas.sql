-- Clientes por estado (já padronizando maiúsculas)
--SELECT UPPER(estado), COUNT(id_cliente)

--FROM clientes
--GROUP BY UPPER(estado)
--ORDER BY  COUNT(id_cliente) DESC;



-- categorias
--produtos
--clientes
--pedidos
--itens_pedido

-- Total de pedidos por estado
--SELECT UPPER(t2.estado) AS estado,
       --count(t1.id_pedido) AS total_pedidos
--FROM pedidos AS t1
--LEFT JOIN clientes AS t2
--on t1.id_cliente = t2.id_cliente
--GROUP BY UPPER(t2.estado)
--ORDER BY count(t1.id_pedido) DESC;

-- Total de pedidos cancelados por estado
--SELECT UPPER(t2.estado) AS estado,
       --count(t1.id_pedido) AS total_pedidos_cancelados
--FROM pedidos AS t1
--LEFT JOIN clientes AS t2
--on t1.id_cliente = t2.id_cliente
--WHERE t1.status = 'Cancelado'
--GROUP BY UPPER(t2.estado)
--ORDER BY count(t1.id_pedido) DESC;


-- Taxa de cancelamento por estado
/*
SELECT UPPER(t2.estado) AS estado,

       COUNT(t1.id_pedido) AS total_pedidos,

       SUM(CASE
         WHEN t1.status = 'Cancelado' THEN 1
       ELSE 0
       END) AS total_cancelados,
       

       
       ROUND(100.0 * SUM(CASE
         WHEN t1.status = 'Cancelado' THEN 1
       ELSE 0
       END) /  COUNT(t1.id_pedido), 2) || '%' AS taxa_cancelamento



FROM pedidos as t1
LEFT JOIN clientes as t2
on t1.id_cliente = t2.id_cliente
GROUP BY UPPER(t2.estado);
*/

-- Total de pedidos por mês
/*SELECT 
 strftime('%Y-%m', data_pedido) AS data,
 COUNT(id_pedido) AS total_pedidos
 
from pedidos
GROUP BY strftime('%Y-%m', data_pedido)
ORDER BY data
*/

-- Faturamento Mensal
/*
SELECT 
 strftime('%Y-%m', t2.data_pedido) AS data,
 ROUND(SUM(quantidade * preco_unitario * (1 - desconto)), 2) AS faturamento_total
FROM itens_pedido AS t1
INNER JOIN pedidos AS t2
on t1.id_pedido = t2.id_pedido
WHERE t2.status = 'Entregue'
GROUP BY strftime('%Y-%m', t2.data_pedido) 
ORDER BY data
*/

-- Produtos mais vendidos entre os pedidos entregues

/*SELECT t2.nome AS produto,
       SUM(t1.quantidade) AS unidades_vendidas 

FROM itens_pedido AS t1
INNER JOIN produtos AS t2
on t1.id_produto = t2.id_produto

INNER JOIN pedidos AS t3
on t1.id_pedido = t3.id_pedido
WHERE t3.status = 'Entregue'
GROUP BY t2.id_produto, t2.nome
ORDER BY SUM(t1.quantidade)  DESC
*/




/*SELECT 
     t3.nome AS nome_categoria,

    ROUND(SUM(t1.quantidade * t1.preco_unitario * (1 - t1.desconto)), 2) AS Faturamento

 FROM itens_pedido as t1
 INNER JOIN produtos as t2
 on t1.id_produto = t2.id_produto

 INNER JOIN categorias AS t3
 on t2.id_categoria = t3.id_categoria

 INNER JOIN pedidos AS t4
    ON t1.id_pedido = t4.id_pedido

 WHERE t4.status = 'Entregue'

 GROUP BY t3.id_categoria, t3.nome
 ORDER BY faturamento DESC;
 */


 -- Formas de pagamentos mais utilizadas

 /*SELECT t1.forma_pagamento,
       COUNT(t1.forma_pagamento) AS total_de_vezes
 
 FROM pedidos AS t1

 GROUP BY t1.forma_pagamento
 
 ORDER BY COUNT(t1.forma_pagamento) DESC
 */



 -- Quais produtos têm a maior diferença entre o preço de venda e o custo?

 SELECT  
         nome,
         preco,
         custo,
       preco - custo AS diferenca

 FROM produtos
 ORDER BY diferenca DESC
 

 



 
 











