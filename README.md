# IAA Aqueous Solvation: CPMD and Electron-Density Analyses

## Description

This repository contains computational data, numerical results, and analysis scripts supporting the manuscript entitled:

**"Aqueous Solvation and Hydrogen Bonding of Neutral Indole-3-Acetic Acid Investigated by Car–Parrinello Molecular Dynamics and Electron-Density Analyses"**

Submitted to *Scientific Reports*.

The study investigates the structural, dynamical, and electronic properties of neutral indole-3-acetic acid (IAA) in aqueous solution using Car–Parrinello molecular dynamics (CPMD), radial distribution functions (RDFs), coordination analyses, RDF-derived potentials of mean force (PMFs), and electron-density analyses based on the Quantum Theory of Atoms in Molecules (QTAIM), Reduced Density Gradient (RDG), and Interaction Region Indicator (IRI).

The repository provides numerical data files (`.dat`), Gnuplot scripts (`.gnu`), and VMD/Tcl scripts (`.tcl`) used to process and visualize the results presented in the manuscript.

The original CPMD trajectory, simulation energy data, and representative molecular geometries are deposited separately in the Zenodo repository.

## Repository Contents

### 01_CPMD_Simulation

Information and documentation related to the CPMD simulations and computational routines employed in this study.

The complete molecular dynamics trajectory (`TRAJEC.xyz`) and simulation energy file (`ENERGY`) are available in the associated Zenodo dataset.

### 02_Figure_2_Energy_Tempature

Numerical data and scripts used to generate Figure 2, showing the monitoring of electronic adiabaticity and ionic temperature during the CPMD simulation.

The original `ENERGY` file is available in Zenodo.

### 03_Figure_3_RDF

Radial distribution function (RDF) data and plotting scripts for the three main IAA–water interactions:

- N–H···OW (H19)
- O–H···OW (H22)
- C=O···HW (O13)

These data support the RDF and coordination-number profiles presented in Figure 3.

### 04_Figure_4_Coordination

Numerical data and scripts used to visualize the time evolution of solvent coordination and hydrogen-bond interactions at the H19, H22, and O13 hydration sites.

These files support the results presented in Figure 4.

### 05_Figure_5_PMF

Numerical data and plotting scripts used to generate the RDF-derived potentials of mean force (PMFs) for the three principal IAA–water interactions presented in Figure 5.

### 06_Table_1_Geometry

Geometrical data and related documentation for the average intermolecular distances and hydrogen-bond angles obtained from the CPMD trajectory.

These results support the structural analyses presented in Table 1.

### 07_Table_2_QTAIM

Numerical data containing the QTAIM topological descriptors calculated at bond critical points (BCPs) for six representative IAA–water configurations.

The descriptors include electron density, Laplacian of the electron density, kinetic and potential energy densities, total energy density, and ellipticity.

These data support Table 2 of the manuscript.

### 08_Figures_6_7_8_RDG_IRI

Numerical data, Gnu
