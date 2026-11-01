# ==========================================================
# Script QTAIM: 4 Fotos, Transparência e Auto-Reset
# ==========================================================

# 1. Configurações de visualização
display resize 1920 1080
display rendermode GLSL
light 0 on; light 1 on; light 2 on; light 3 on

# 2. Definição dos IDs das moléculas
set mol_ids {0 1 2 3}

# Garante que tudo esteja ligado antes de começar
foreach id $mol_ids { mol on $id }

# 3. Loop de renderização (Para na 4ª foto)
for {set i 0} {$i < [llength $mol_ids]} {incr i} {
    
    set n_foto [expr $i + 1]
    set outfile "Figura_QTAIM_${n_foto}.png"
    
    display update
    
    puts "Renderizando: $outfile (FullHD + Transparência)"
    
    # A flag '-trans_vmd' ativa o fundo transparente no Tachyon
    render TachyonInternal $outfile -res 1920 1080 -aasamples 12 -trans_vmd
    
    # Desativa a molécula atual para preparar a próxima foto
    set alvo [lindex $mol_ids $i]
    mol off $alvo
}

# ==========================================================
# BLOCO DE RESET
# Reabilita todas as moléculas para continuar a análise
# ==========================================================
foreach id $mol_ids { 
    mol on $id 
}

display update
puts "Processo concluído!"
puts "4 fotos geradas com fundo transparente e visualização resetada."