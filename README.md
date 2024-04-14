# LoFT

LoFT presents a Low-order modelling of floating offshore wind turbines(FOWTs). The main purposes of LoFT are threefold:
1. Enable parallel and fast simulations of numerous FOWTs
2. Faciliate the training of deep reinforcement learning
3. Present a fair comparison of different control-oriented modelling of FOWTs

N.B.: The relevent articles were all written in English. Our repository contains Chinese translations of them.

## Brief Summary
The frequency support capability of floating offshore wind turbines varies with platform motions. Additionally, the floating platform may experience **_more significant pitch motion_** during the system frequency response. In response to these two issues, a frequency response control strategy that takes platform motions into account is proposed. This strategy **_ajusts droop according to floating platform motions_**,power reserve and rotor kinetics. Specifically, for above rated wind conditions, a **_temporary individual pitch control_** strategy is designed for mitigating the significant pitch motion of the floating platform during the frequency response process. 
<img src=/X232721visio.png width=45%>
## Quick Use
run runFast_OF_13mps.m
## Project organization
- PG = project-generated
- HW = human-writable
- RO = read only
```
.
├── .gitignore
├── CITATION.md
├── LICENSE.md
├── README.md
├── bin                         <- Compiled and external code, ignored by git (PG)
│   ├── external/Casadi         <- When running simulations on a cluster, place compiled CasADi code with IPOPT solver here. (RO)
|   └── model_Favoreel1999.m    
├── data                        <- All project data, ignored by git
│   ├── processed               <- The final, canonical data sets for modeling. (PG)
│   ├── raw                     <- The original, immutable data dump. (RO)
│   └── temp                    <- Intermediate data that has been transformed. (PG)
├── results         
│   └── figures                 <- Figures for the manuscript or reports (PG)
└── src                         <- Source code for this project (HW)

```
## Credit
We request the to cite 

## License
This project is licensed under the terms of the [MIT License](/LICENSE.md)
