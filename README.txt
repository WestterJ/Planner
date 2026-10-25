Planner Escolar Familiar — v1.0.1

Conteúdo:
- index.html: app HTML.
- schema.sql: tabela compartilhada e políticas RLS.
- README.txt: instruções.

Configuração:
1. Execute schema.sql no SQL Editor do projeto Supabase existente.
2. Publique index.html junto ao supabase-config.js do seu app.
3. Confirme os URLs em Authentication > URL Configuration.
4. Crie/entre com as contas familiares.

Backup JSON:
A seção “Backup e restauração” permite exportar registros para JSON e importar um JSON de backup. A importação adiciona registros ao banco compartilhado; não apaga registros existentes. Recomenda-se exportar um backup antes de importar.

IA:
O botão de importação com IA usa a Edge Function dynamic-service existente. A compatibilidade deve ser validada no projeto publicado. PDFs precisam conter texto selecionável; para documentos digitalizados, use fotos.
