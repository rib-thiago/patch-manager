# 🛠️ Patch Manager

## 📜 Descrição

O `patch-manager.sh` é um script projetado para criar uma solução de controle de versões no estilo Git, utilizando ferramentas Unix tradicionais. Com este script, você pode gerenciar alterações em diretórios e arquivos, criar e aplicar patches, e manter um registro das modificações. 

## 🚀 Uso

O `patch-manager.sh` fornece comandos para a criação e aplicação de patches, bem como para o gerenciamento do histórico de alterações. Aqui estão os principais comandos:

- **Gerar um patch:**
  ```bash
  ./patch-manager.sh gerar-patch <dir_original> <dir_modificado> <patch>
  ```
  Cria um patch que captura as diferenças entre dois diretórios.

- **Aplicar um patch:**
  ```bash
  ./patch-manager.sh aplicar-patch <diretório> <patch>
  ```
  Aplica um patch a um diretório, refletindo as mudanças registradas.

- **Exibir o histórico de patches:**
  ```bash
  ./patch-manager.sh historico <diretório>
  ```
  Mostra o histórico dos patches aplicados a um diretório, permitindo rastrear as modificações ao longo do tempo.

## 📦 Exemplo de Uso

1. **Criar um tarball do diretório original (opcional, se você já tem o tarball, pule esta etapa):**
   ```bash
   tar -cvf original.tar original/
   ```

   Experimenta usar o [pack-unpack](https://github.com/rib-thiago/pack-unpack) para criar um tarball.


2. **Extrair o tarball para o diretório modificado:**
   ```bash
   ./patch-manager.sh extrair-tarball original.tar modificado
   ```

3. **Fazer modificações no diretório `modificado`:**
   (Edite arquivos e faça alterações conforme necessário.)

4. **Gerar um patch com as diferenças:**
   ```bash
   ./patch-manager.sh gerar-patch original modificado update.patch
   ```

5. **Aplicar o patch a um novo diretório (ou o diretório original):**
   ```bash
   ./patch-manager.sh aplicar-patch meu-diretorio update.patch
   ```

6. **Exibir o histórico de patches aplicados:**
   ```bash
   ./patch-manager.sh historico meu-diretorio
   ```

## 📋 TODO

Aqui estão algumas melhorias e recursos planejados para tornar o `patch-manager.sh` ainda mais robusto:

- 🚀 **Gerenciamento Avançado de Patches**: Suporte para múltiplos patches e a capacidade de aplicá-los em sequência.
- 📝 **Documentação Detalhada e Logs**: Implementar registros detalhados sobre as alterações feitas por cada patch.
- ⚙️ **Verificação de Integridade**: Mecanismos para garantir a aplicação correta dos patches e detectar conflitos.
- 📂 **Histórico de Versões**: Sistema de histórico mais completo para rastrear e reverter mudanças de forma eficiente.
- 🌐 **Interface de Usuário**: Desenvolver uma interface gráfica simples para facilitar o uso e gerenciamento dos patches.

## 📧 Contato

Para perguntas ou para entrar em contato, envie um e-mail para [Thiago Ribeiro](mailto:mackandalls@gmail.com).

---

*Versão 0.1 - 25/07/24*
```