# ==========================================================
# Script Corrigido: Renderização Sequencial (ON/OFF)
# ==========================================================

# 1. Ajustes iniciais de visualização
display resize 1920 1080
display rendermode GLSL
light 0 on
light 1 on
light 2 on
light 3 on

# 2. Lista de IDs das moléculas (conforme sua imagem: 0, 1, 2 e 3)
set mol_ids {0 1 2 3}

# Garante que todas comecem ligadas (coluna D marcada)
foreach id $mol_ids { 
    mol on $id 
}

# 3. Loop para gerar as fotos
for {set i 0} {$i <= [llength $mol_ids]} {incr i} {
    
    # Define o nome da foto (Foto 1, Foto 2...)
    set n_foto [expr $i + 1]
    set outfile "Figura_Sequencial_${n_foto}.png"
    
    # Atualiza a tela antes de tirar a "foto"
    display update
    
    puts "Gerando: $outfile (Tachyon FullHD + Anti-Aliasing)"
    render TachyonInternal $outfile -res 1920 1080 -aasamples 12
    
    # Desativa a próxima molécula da lista para a próxima rodada
    if {$i < [llength $mol_ids]} {
        set alvo [lindex $mol_ids $i]
        mol off $alvo
        puts "Molécula ID $alvo foi desligada (OFF)."
    }
}

puts "Todas as fotos foram geradas com sucesso!"