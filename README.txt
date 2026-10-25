# Planner Escolar Familiar — v1.0.0

## Inclui
- `index.html`: aplicativo HTML responsivo.
- `schema.sql`: cria a tabela compartilhada e as políticas RLS no Supabase.
- `README.txt`: estas instruções.

## Configuração com o projeto Supabase existente
O HTML primeiro tenta carregar `supabase-config.js` (o padrão usado em seus outros apps). Ele procura `window.NUTRI_SUPABASE_CONFIG` ou `window.SUPABASE_CONFIG`, com campos `url` e `key` (ou `anonKey`). Se o arquivo não existir, usa como fallback a URL e a chave pública já informadas na conversa. A chave `sb_publishable_...` é uma chave pública; nunca coloque service_role ou segredo privado no HTML.

1. No SQL Editor do seu projeto Supabase existente, execute o conteúdo de `schema.sql`.
2. Coloque `index.html` e o seu `supabase-config.js` na mesma pasta/repositório ao publicar.
3. Em Authentication > URL Configuration, confira os URLs autorizados do site publicado.
4. Crie as contas do pai, da mãe e da filha na tela do app. Se a confirmação por e-mail estiver ativada, confirme cada conta.
5. Todos os usuários autenticados nesse projeto podem ver, incluir, editar e excluir os mesmos registros desta tabela. Isso atende ao uso familiar, mas significa que qualquer outra conta autenticada do mesmo projeto também terá acesso à tabela; use apenas contas de confiança nesse projeto.

## IA para PDF/foto
O botão usa a Edge Function `dynamic-service` existente e o mesmo formato de requisição Gemini que o app Nutri+Bio já utiliza. O PDF precisa conter texto selecionável; para documentos digitalizados, envie fotos das páginas. A IA prepara uma prévia e você confirma antes de salvar. O serviço de IA precisa estar implantado e aceitar a sessão autenticada como nos outros apps.

## Nota de segurança
O app usa Supabase Auth e RLS. Não publique chaves secretas no frontend. O cadastro de contas depende das configurações de Auth do projeto. Os dados ficam compartilhados, não separados por usuário.
