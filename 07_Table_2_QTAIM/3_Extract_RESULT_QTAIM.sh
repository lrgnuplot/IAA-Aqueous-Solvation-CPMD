#!/bin/bash

# 1. Busca o arquivo de entrada (ajustado para aceitar .txt ou .dat)
ARQUIVO_ENTRADA=$(ls *-CPprop.txt *-CPprop.dat 2>/dev/null | head -n 1)

if [ -z "$ARQUIVO_ENTRADA" ]; then
    echo "Erro: Nenhum arquivo *-CPprop.txt ou .dat encontrado!"
    exit 1
fi

# DOS2UNIX para evitar problemas de caracteres ocultos do Windows
dos2unix "${ARQUIVO_ENTRADA}"

# Nome do arquivo de saída
ARQUIVO_SAIDA="${ARQUIVO_ENTRADA%.*}_QTAIM.txt"

# Lista de CPs (ajuste conforme necessário)
CPS=("57" "62" "67" "68")

# --- CABEÇALHO ATUALIZADO ---
# Adicionado "Atoms" entre CP e Type
echo "CP Atoms Type Density Laplacian Energy Ellipticity Lambda1 Lambda2 Lambda3 G(r) K(r) V(r) RDG" > "$ARQUIVO_SAIDA"

for CP in "${CPS[@]}"; do
    LINHA_CP=$(grep -n -w "$CP," "$ARQUIVO_ENTRADA" | cut -d: -f1)

    if [ -z "$LINHA_CP" ]; then
        echo "Aviso: CP $CP não encontrado."
        continue
    fi

    # Captura um bloco de 50 linhas a partir do CP
    LINHA_FIM=$((LINHA_CP + 50))
    BLOCO_DADOS=$(sed -n "${LINHA_CP},${LINHA_FIM}p" "$ARQUIVO_ENTRADA")

    # --- EXTRAÇÃO DOS ÁTOMOS CONECTADOS ---
    # Extrai "28(O)--31(O)" removendo espaços extras
    ATOMS=$(echo "$BLOCO_DADOS" | grep "Connected atoms:" | cut -d: -f2 | sed 's/ //g')
    
    # Se não encontrar átomos (caso de CP que não é BCP), coloca um traço
    if [ -z "$ATOMS" ]; then ATOMS="N/A"; fi

    # Extração das demais propriedades
    TYPE=$(echo "$BLOCO_DADOS" | grep "$CP," | awk '{print $5}')
    DENSITY=$(echo "$BLOCO_DADOS" | grep "Density of all electrons:" | awk '{print $NF}')
    LAPLACIAN=$(echo "$BLOCO_DADOS" | grep "Laplacian of electron density:" | awk '{print $5}')
    ENERGY=$(echo "$BLOCO_DADOS" | grep "Energy density E(r) or H(r):" | awk '{print $6}')
    LAMBDA1=$(echo "$BLOCO_DADOS" | grep "Eigenvalues of Hessian:" | awk '{print $4}')
    LAMBDA2=$(echo "$BLOCO_DADOS" | grep "Eigenvalues of Hessian:" | awk '{print $5}')
    LAMBDA3=$(echo "$BLOCO_DADOS" | grep "Eigenvalues of Hessian:" | awk '{print $6}')
    ELLIPTICITY=$(echo "$BLOCO_DADOS" | grep "Ellipticity of electron density:" | awk '{print $NF}')
    GR=$(echo "$BLOCO_DADOS" | grep "Lagrangian kinetic energy G(r):" | awk '{print $NF}')
    KR=$(echo "$BLOCO_DADOS" | grep "Hamiltonian kinetic energy K(r):" | awk '{print $NF}')
    VR=$(echo "$BLOCO_DADOS" | grep "Potential energy density V(r):" | awk '{print $NF}')
    RDG=$(echo "$BLOCO_DADOS" | grep "Reduced density gradient (RDG):" | awk '{print $NF}')

    # --- GRAVAÇÃO DOS DADOS COM O NOVO CAMPO ---
    echo "$CP $ATOMS $TYPE $DENSITY $LAPLACIAN $ENERGY $ELLIPTICITY $LAMBDA1 $LAMBDA2 $LAMBDA3 $GR $KR $VR $RDG" >> "$ARQUIVO_SAIDA"

done

echo "Processamento concluído. Resultados em: $ARQUIVO_SAIDA"