# Olist_Case_Study-
# Análise de Dados Olist: Impacto do SLA de Entrega no NPS

## 1. Situação (Contexto)
No mercado de e-commerce, o custo de aquisição de clientes é elevado, tornando a retenção e o monitoramento do Net Promoter Score (NPS) fatores críticos para a saúde financeira da operação. Para compreender as variáveis logísticas que afetam essa retenção, este projeto utiliza o dataset público da Olist, englobando mais de 100 mil registros reais de transações no e-commerce brasileiro.

## 2. Tarefa (Objetivo)
O objetivo desta análise foi responder a uma pergunta de negócio central: qual é a correlação quantitativa entre o tempo de entrega de um pedido (SLA logístico) e a nota de satisfação final atribuída pelo consumidor?

## 3. Ação (Metodologia e Execução)
Para processar o volume de dados, a arquitetura analítica foi estruturada localmente utilizando MariaDB, gerenciada pela IDE DataGrip. O processo de ETL (Extração, Transformação e Carga) exigiu tratamento focado na integridade dos dados:
- **Data Cleaning:** Durante a carga, caracteres especiais em campos de texto livre (comentários dos clientes) geraram conflitos de importação. Optou-se por aplicar a exclusão (drop lógico) dessas colunas ruidosas no momento do mapeamento, mantendo estritamente as chaves relacionais, timestamps e notas. Isso garantiu uma base íntegra e otimizada para cálculos quantitativos.
- **Modelagem Relacional:** Criação de tabelas com chaves estrangeiras vinculando as informações de logística (Pedidos) com os dados de qualidade (Avaliações).
- **Processamento (SQL):** Desenvolvimento de query analítica utilizando funções de agregação matemática (`AVG`, `ROUND`) e de tempo (`DATEDIFF`) para cruzar os dias em trânsito com a nota final de cada pedido, agrupando os resultados em ordem decrescente de satisfação.

## 4. Resultado (Insights de Negócio)
A extração de dados evidenciou um padrão operacional de alto impacto:
- **Promotores (Nota 5):** Receberam seus pedidos em uma média de **10.6 dias**.
- **Detratores (Nota 1):** Registraram uma espera média de **21.3 dias**.

**Conclusão Financeira e Operacional:** A análise comprova que o atraso logístico dobra a percepção de tempo de espera e afeta diretamente a avaliação do serviço. Otimizar o tempo de trânsito é a principal alavanca para reduzir o risco de churn (cancelamento de clientes) e minimizar os custos operacionais com atendimento (SAC).

## Estrutura do Repositório
- `/data/`: Diretório destinado aos arquivos CSV brutos (olist_orders_dataset.csv, olist_order_reviews_dataset.csv).
- `/sql/`: Contém os scripts DDL (criação das tabelas) e DML (queries de análise).
