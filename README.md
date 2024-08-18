# LoFT v 0.1

  LoFT presents a Low-order modelling of floating offshore wind turbines(FOWTs) for training. The main purposes are threefold:
1. Enable parallel and fast simulations of numerous FOWTs
2. Faciliate the application of deep reinforcement learning in FOWTs
3. Present a fair comparison between different low-order modelling of FOWTs (to be released)

% N.B.: Full code for training and validation will be released if the paper get accepted by a journal.

## Brief Summary
  The basic motivation behind LoFT is to provide a tool to facliate the application of deep reinforcement learning in floating offshore wind farms.  To do this, the simulation environment has to be fast enough to interact with the agent for over millions of times during training. As a result, LoFT put efficiency in the first place and only reservs the degrees of freedom that notabley influence the power output of FOWTs. Moreover, LoFT supports **_domain randomization_** , which is considered as the key source of robustness of deep reinforcement learing to tranfer to the real world, as shown in Fig.1. 
  
  In the future development, we will  develop the coupling between platform motions and wake effect.

## Quick Use
run 'Example1.m' to change environment settings and simulate 5 FOWTs.

run 'Example2.m' to simulate 70 FOWTs considering wake effect.

run 'Compare.m'  to see the validation of LoFT against OpenFast.

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
If you consider this repository helpful for you research, please cite: 

"Primary Frequency Response of Floating Offshore Wind Turbines with Deep Reinforcement Learning with Domain Randomization", submitted to IEEE Transactions on Sustainable Energy.

## License
This project is licensed under the terms of the [Apache License Version 2.0](/LICENSE.md)
