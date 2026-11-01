#======================================================
# SCRIPT IRIFILL ADAPTADO (VERSÃO CORRIGIDA)
#======================================================

# Configurações Visuais Padronizadas
color Display Background white
axes location Off
display depthcue off
display rendermode GLSL

# Função para encontrar a string base correta (ex: H22maior)
proc find_base_string {} {
    set files [glob -nocomplain *-IRI-func1.cub]
    if {[llength $files] == 0} {
        puts "Erro: Nenhum arquivo *-IRI-func1.cub encontrado na pasta."
        exit
    }
    
    set filename [lindex $files 0]
    # Encontra a posição do primeiro "-IRI" no nome do arquivo
    set pos [string first "-IRI" $filename]
    
    # Retorna apenas o que vem antes de "-IRI"
    return [string range $filename 0 [expr $pos - 1]]
}

# Obtém a string base automaticamente (ex: H22maior)
set base_string [find_base_string]

puts "Carregando arquivos com base: $base_string"

# Carrega a volumetria
# func1 = Isossuperfície | func2 = Dados de Cor (sign(L2)rho)
mol new ${base_string}-IRI-func1.cub
mol addfile ${base_string}-IRI-func2.cub

# Limpa representações padrão
mol delrep 0 top

# 1. Representação das Esferas (Átomos)
mol representation CPK 1.0 0.3 18.0 16.0
mol color Element
mol addrep top

# 2. Representação da Isossuperfície IRI
# Isosurface de 1.0, colorida pelo Volume 1 (func2.cub)
mol representation Isosurface 1.0 1 0 0 1 1
mol color Volume 0
mol addrep top

# Configuração da Escala de Cores (Azul-Verde-Vermelho)
# Faixa típica para IRI/NCI: -0.04 a 0.02 a.u.
mol scaleminmax top 1 -0.04 0.02
color scale midpoint 0.666
color scale method BGR

# Estética: Carbono em cinza claro
color Element C gray
mol color Element
color change rgb gray 0.65 0.65 0.65

puts "Visualização IRI de $base_string carregada com sucesso."