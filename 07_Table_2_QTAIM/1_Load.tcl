# Configurações iniciais do visualizador
color Display Background white
axes location Off
display depthcue off
display rendermode GLSL
color Name C gray
color change rgb gray 0.65 0.65 0.65

#PASTA
#cd "C:/LR/2025/IC MsC DR/AnnaMaria/QTAIM/FCHK/O5_H177_O19_MIN"

# Parâmetros visuais
set CPsize 0.07
set pathsize 0.02

# Função para encontrar a string base comum nos arquivos
proc find_base_string {} {
    set files [glob -nocomplain *-CPs.pdb *-paths.pdb *-mol.pdb]
    if {[llength $files] == 0} {
        puts "Erro: Nenhum arquivo com padrão *-{CPs,paths,mol}.pdb encontrado"
        exit
    }
    
    # Extrai a parte comum antes do sufixo
    set base [file rootname [lindex $files 0]]
    return [string range $base 0 end-4]
}

# Obtém a string base automaticamente
set base_string [find_base_string]

puts "Carregando arquivos com base: $base_string"

# Carrega os arquivos encontrados
mol new ${base_string}-CPs.pdb
mol new ${base_string}-paths.pdb
mol new ${base_string}-mol.pdb

# Configurações para os Critical Points (CPs)
mol modselect 0 0 name C
mol modstyle 0 0 VDW $CPsize 22.0
mol modcolor 0 0 ColorID 11

mol addrep 0
mol modselect 1 0 name N
mol modstyle 1 0 VDW $CPsize 22.0
mol modcolor 1 0 ColorID 3

mol addrep 0
mol modselect 2 0 name O
mol modstyle 2 0 VDW $CPsize 22.0
mol modcolor 2 0 ColorID 4

mol addrep 0
mol modselect 3 0 name F
mol modstyle 3 0 VDW $CPsize 22.0
mol modcolor 3 0 ColorID 7

# Configurações para os Paths
mol modstyle 0 1 VDW $pathsize 22.0
mol modcolor 0 1 ColorID 32

# Configurações para a Molécula
mol modstyle 0 2 CPK 1.0 0.3 18.0 16.0

# Função para adicionar labels (mantida do script original)
proc labcp {cptype {labsize 1.8} {offsetx -0.1} {offsety 0.0}} {
    label delete Atoms all
    if {$cptype=="no"} {return}
    color Labels Atoms blue
    label textthickness 2.000000
    label textsize $labsize
    set atmsel all
    if {$cptype=="3n3"} {set atmsel "name C"}
    if {$cptype=="3n1"} {set atmsel "name N"}
    if {$cptype=="3p1"} {set atmsel "name O"}
    if {$cptype=="3p3"} {set atmsel "name F"}
    set sel [atomselect 0 $atmsel]
    set k 0
    foreach i [$sel list] {
        label add Atoms 0/$i
        label textformat Atoms $k { %1i }
        label textoffset Atoms $k "$offsetx $offsety"
        incr k
    }
    $sel delete
}

# Verifica e carrega arquivos de função cub se existirem
if {[file exists func1.cub] && [file exists func2.cub]} {
    mol new func1.cub
    mol addfile func2.cub
    mol delrep 0 top
    mol representation CPK 1.0 0.3 18.0 16.0
    mol addrep top
    mol representation Isosurface 0.65000 1 0 0 1 1
    mol color Volume 0
    mol addrep top
    mol scaleminmax top 1 -0.035 0.02
    color scale method BGR
}

puts "Visualização configurada com sucesso para $base_string"

#labcp 3n1 1.5 -0.1 0.1
#labcp all 1.5 -0.1 0.1
labcp 3n1 1.5 -0.07 0.05

# render Tachyon "output.png" -aasamples 12 -res 1920 1080 -format PNG -transparent