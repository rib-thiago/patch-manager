#!/usr/bin/env bash
# ---------------------------------------------------------------
# Script    : patch-manager
# Descrição : Gerencia a criação, aplicação e registro de patches 
#              para atualizar e versionar diretórios.
# Autor     : Thiago Ribeiro <mackandalls@gmail.com>
# Data      : 25/07/24
# Licença   : 
# ---------------------------------------------------------------
# Uso: patch-manager [OPÇÕES] <diretórios> <patch>
# ---------------------------------------------------------------
# Comandos disponíveis:
#   gerar-patch <dir_original> <dir_modificado> <patch> - Gera um patch para diferenças entre dois diretórios
#   aplicar-patch <diretório> <patch> - Aplica um patch a um diretório e registra a aplicação
#   historico <diretório> - Exibe o histórico de patches aplicados ao diretório
# ---------------------------------------------------------------

# Função para gerar um patch
gerar_patch() {
    local dir_original="$1"
    local dir_modificado="$2"
    local patch="$3"
    echo "Gerando patch para diferenças entre $dir_original e $dir_modificado..."
    diff -urN "$dir_original" "$dir_modificado" > "$patch"
    echo "Patch gerado com sucesso!"
}

# Função para aplicar um patch
aplicar_patch() {
    local dir="$1"
    local patch="$2"
    echo "Aplicando patch $patch ao diretório $dir..."
    patch -p1 -d "$dir" < "$patch"
    echo "Patch aplicado com sucesso!"
    registrar_patch "$dir" "$patch"
}

# Função para registrar o patch aplicado
registrar_patch() {
    local dir="$1"
    local patch="$2"
    local log_file="$dir/patches.log"
    
    echo "Registrando aplicação do patch $patch no diretório $dir..."
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Patch aplicado: $patch" >> "$log_file"
    echo "Registro do patch atualizado com sucesso!"
}

# Função para exibir o histórico de patches
exibir_historico() {
    local dir="$1"
    local log_file="$dir/patches.log"
    
    if [ -f "$log_file" ]; then
        echo "Histórico de patches para o diretório $dir:"
        cat "$log_file"
    else
        echo "Nenhum histórico encontrado para o diretório $dir."
    fi
}

# Verificar número de argumentos
if [ "$#" -lt 2 ]; then
    echo "Uso: $0 <comando> <opções>"
    echo "Comandos disponíveis:"
    echo "  gerar-patch <dir_original> <dir_modificado> <patch> - Gera um patch"
    echo "  aplicar-patch <diretório> <patch> - Aplica um patch ao diretório"
    echo "  historico <diretório> - Exibe o histórico de patches aplicados"
    exit 1
fi

# Processar comando
comando="$1"
shift

case "$comando" in
    gerar-patch)
        gerar_patch "$@"
        ;;
    aplicar-patch)
        aplicar_patch "$@"
        ;;
    historico)
        exibir_historico "$@"
        ;;
    *)
        echo "Comando inválido: $comando"
        exit 1
        ;;
esac
