Planner Escolar Familiar — v1.0.3

Correções:
- O importador de PDF agora envia modo: edital para dynamic-service, usando o limite de texto longo já implementado (100.000 caracteres).
- Para PDFs acima de 95.000 caracteres, apresenta mensagem orientando a dividir o documento, em vez de devolver erro genérico.
- A versão visível foi atualizada para v1.0.3.
- Fotos continuam usando o modo de imagem original.
- Não é necessário executar SQL novamente.

Publicação: substitua o index.html no repositório e mantenha supabase-config.js.
Observação: esta versão corrige o limite imediato; a divisão automática em vários pedidos pode ser implementada em etapa posterior.
