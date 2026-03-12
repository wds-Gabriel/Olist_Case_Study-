import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

#dados extraídos da análise
data = {
    'Nota do Cliente': [5, 4, 3, 2, 1],
    'Dias para Entrega': [10.6, 12.3, 14.2, 16.6, 21.3]
}
df = pd.DataFrame(data)

#configuração visual
plt.figure(figsize=(10, 6))
sns.set_theme(style="whitegrid")
grafico = sns.barplot(x='Nota do Cliente', y= 'Dias para Entrega', data=df, palette='viridis')

#colocar os rótulos
for p in grafico.patches:
    grafico.annotate(format(p.get_height(), '.1f'),
                     (p.get_x() + p.get_width() / 2., p.get_height()),
                     xytext= (0, 9),
                     textcoords= "offset points",)

plt.title('Impacto do Tempo de Entrega na Satisfação do Cliente (Olist)', fontsize = 14)
plt.xlabel('Nota de avaliação (NPS)', fontsize = 12)
plt.ylabel('Média de dias para entrega', fontsize = 12)

#SALVA
plt.savefig('Olist_case_Study_graph.png', dpi=300, bbox_inches='tight')
plt.show()